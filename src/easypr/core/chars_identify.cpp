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

CharsIdentify::CharsIdentify() {}

bool CharsIdentify::loadAnn(const char* annFile, const char* charfile)
{
  ann_ = ml::ANN_MLP::load<ml::ANN_MLP>(annFile);
  if(ann_.empty())
  {
	  return false;
  }

  kv_ = new Kv();
  if(kv_->load(charfile))
  {
	  return true;
  }
  else
  {
    return true;
  }
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
  int index = static_cast<int>(ann_->predict(feature));
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
