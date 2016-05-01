#include "easypr/core/chars_identify.h"
#include "easypr/config.h"
#include "easypr/core/core_func.h"

namespace easypr {

CharsIdentify* CharsIdentify::instance_ = NULL;

CharsIdentify* CharsIdentify::instance() {
  if (!instance_) {
    instance_ = new CharsIdentify;
  }
  return instance_;
}

CharsIdentify::CharsIdentify() {
  ann_ = ml::ANN_MLP::load<ml::ANN_MLP>(kDefaultAnnPath);
  kv_ = new Kv();
  kv_->load("../../data/etc/province_mapping");
}

CharsIdentify::~CharsIdentify()
{
	if(kv_)
	{
		delete kv_;
		kv_= NULL;
	}
}


std::pair<std::string, std::string> CharsIdentify::identify(cv::Mat input) {
  cv::Mat feature = features(input, kPredictSize);
  auto index = static_cast<int>(ann_->predict(feature));
  if (index < 34) {
    return std::make_pair(kChars[index], kChars[index]);
  } else {
    const char* key = kChars[index];
    std::string s = key;
    std::string province = kv_->get(s);
    return std::make_pair(s, province);
  }
}
}
