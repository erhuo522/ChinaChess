#include "easypr/train/svm_train.h"
#include "easypr/core/feature.h"
#include "easypr/util/util.h"

#ifdef OS_WINDOWS
#include <ctime>
#endif

using namespace cv::ml;

namespace easypr {

SvmTrain::SvmTrain(const char* plates_folder, const char* xml)
    : plates_folder_(plates_folder), svm_xml_(xml) {
  assert(plates_folder);
  assert(xml);
}

void SvmTrain::train() {
  svm_ = cv::ml::SVM::create();
  svm_->setType(cv::ml::SVM::C_SVC);
  svm_->setKernel(cv::ml::SVM::RBF);
  svm_->setDegree(0.1);
  // 1.4 bug fix: old 1.4 ver gamma is 1
  svm_->setGamma(0.1); 
  svm_->setCoef0(0.1);
  svm_->setC(1);
  svm_->setNu(0.1);
  svm_->setP(0.1);
  svm_->setTermCriteria(cvTermCriteria(CV_TERMCRIT_ITER, 100000, 0.00001));

 cv::Ptr<cv::ml::TrainData> train_data = tdata();

  fprintf(stdout, ">> Training SVM model, please wait...\n");
  long start = utils::getTimestamp();
  //svm_->trainAuto(train_data, 10, SVM::getDefaultGrid(SVM::C),
  //                SVM::getDefaultGrid(SVM::GAMMA), SVM::getDefaultGrid(SVM::P),
  //                SVM::getDefaultGrid(SVM::NU), SVM::getDefaultGrid(SVM::COEF),
  //                SVM::getDefaultGrid(SVM::DEGREE), true);
  svm_->train(train_data);

  long end = utils::getTimestamp();
  fprintf(stdout, ">> Training done. Time elapse: %ldms\n", end - start);
  fprintf(stdout, ">> Saving model file...\n");
  svm_->save(svm_xml_);
  fprintf(stdout, ">> Your SVM Model was saved to %s\n", svm_xml_);
  fprintf(stdout, ">> Testing...\n");
  this->test();

}

void SvmTrain::test() {
  // 1.4 bug fix: old 1.4 ver there is no null judge
  if (NULL == svm_)
    svm_ = cv::ml::SVM::load<cv::ml::SVM>(svm_xml_);

  if (test_file_list_.empty()) {
    this->prepare();
  }

  double count_all = test_file_list_.size();
  double ptrue_rtrue = 0;
  double ptrue_rfalse = 0;
  double pfalse_rtrue = 0;
  double pfalse_rfalse = 0;

  for (std::vector<TrainItem>::const_iterator it = test_file_list_.begin(); it != test_file_list_.end(); ++it )
  {
    cv::Mat image = cv::imread(it->file);
    if (!image.data) {
      
      std::cout << "no" << std::endl;
      continue;
    }
    cv::Mat feature;
    getHistogramFeatures(image, feature);

    //std::cout << "predict: " << result << std::endl;

    int predict = int(svm_->predict(feature));
    SvmLabel real_label = it->label;
    if (predict == kForward && real_label == kForward) ptrue_rtrue++;
    if (predict == kForward && real_label == kInverse) ptrue_rfalse++;
    if (predict == kInverse && real_label == kForward) pfalse_rtrue++;
    if (predict == kInverse && real_label == kInverse) pfalse_rfalse++;
  }

  std::cout << "count_all: " << count_all << std::endl;
  std::cout << "ptrue_rtrue: " << ptrue_rtrue << std::endl;
  std::cout << "ptrue_rfalse: " << ptrue_rfalse << std::endl;
  std::cout << "pfalse_rtrue: " << pfalse_rtrue << std::endl;
  std::cout << "pfalse_rfalse: " << pfalse_rfalse << std::endl;

  double precise = 0;
  if (ptrue_rtrue + ptrue_rfalse != 0) {
    precise = ptrue_rtrue / (ptrue_rtrue + ptrue_rfalse);
    std::cout << "precise: " << precise << std::endl;
  } else {
    std::cout << "precise: "
              << "NA" << std::endl;
  }

  double recall = 0;
  if (ptrue_rtrue + pfalse_rtrue != 0) {
    recall = ptrue_rtrue / (ptrue_rtrue + pfalse_rtrue);
    std::cout << "recall: " << recall << std::endl;
  } else {
    std::cout << "recall: "
              << "NA" << std::endl;
  }

  double Fsocre = 0;
  if (precise + recall != 0) {
    Fsocre = 2 * (precise * recall) / (precise + recall);
    std::cout << "Fsocre: " << Fsocre << std::endl;
  } else {
    std::cout << "Fsocre: "
              << "NA" << std::endl;
  }
}

void SvmTrain::prepare() {
  srand(unsigned(time(NULL)));

  char buffer[260] = {0};

  sprintf(buffer, "%s/has", plates_folder_);
  std::vector<std::string> has_file_list = utils::getFiles(buffer);
  std::random_shuffle(has_file_list.begin(), has_file_list.end());

  sprintf(buffer, "%s/no", plates_folder_);
  std::vector<std::string> no_file_list = utils::getFiles(buffer);
  std::random_shuffle(no_file_list.begin(), no_file_list.end());

  size_t has_num = has_file_list.size();
  size_t no_num = no_file_list.size();

  fprintf(stdout, ">> Collecting train data...\n");

  int has_for_train = static_cast<int>(has_num * kSvmPercentage);
  int no_for_train = static_cast<int>(no_num * kSvmPercentage);

  // copy kSvmPercentage of has_file_list to train_file_list_
  train_file_list_.reserve(has_for_train + no_for_train);
  for (int i = 0; i < has_for_train; i++) {
    train_file_list_.push_back(TrainItem(has_file_list[i], kForward));
  }
  // copy kSvmPercentage of no_file_list to the end of train_file_list_
  for (int i = 0; i < no_for_train; i++) {
    train_file_list_.push_back(TrainItem(no_file_list[i], kInverse));
  }

  fprintf(stdout, ">> Collecting test data...\n");

  int has_for_test = has_num - has_for_train;
  int no_for_test = no_num - no_for_train;

  // copy the rest of has_file_list to the test_file_list_
  test_file_list_.reserve(has_for_test + no_for_test);
  for (int i = has_for_train; i < has_num; i++) {
    test_file_list_.push_back(TrainItem(has_file_list[i], kForward));
  }

  // copy the rest of no_file_list to the end of the test_file_list_
  for (int i = no_for_train; i < no_num; i++) {
    test_file_list_.push_back(TrainItem(no_file_list[i], kInverse));
  }
}

cv::Ptr<cv::ml::TrainData> SvmTrain::tdata() {
  this->prepare();

  cv::Mat samples;
  std::vector<int> responses;
  for(std::vector<TrainItem>::const_iterator it = train_file_list_.begin();it != train_file_list_.end(); ++it)
  {
    cv::Mat image = cv::imread(it->file);
    if (!image.data) {
      fprintf(stdout, ">> Invalid image: %s  ignore.\n", it->file.c_str());
      continue;
    }
    cv::Mat feature;
    getHistogramFeatures(image, feature);
    feature = feature.reshape(1, 1);

    samples.push_back(feature);
    responses.push_back(int(it->label));
  }

  cv::Mat samples_, responses_;
  samples.convertTo(samples_, CV_32FC1);
  cv::Mat(responses).copyTo(responses_);

  return cv::ml::TrainData::create(samples_, cv::ml::ROW_SAMPLE,
                                   responses_);
}

}  // namespace easypr
