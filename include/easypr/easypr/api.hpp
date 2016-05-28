/*
 * This file provides some of the most commonly used application interfaces.
 */
#ifndef EASYPR_API_HPP
#define EASYPR_API_HPP

#include <string>
#include <vector>
#include <opencv2/opencv.hpp>


namespace easypr {

namespace api {


static bool init( const char* svmFile, const char* annFile, const char* charfile)
{
   if(!CharsIdentify::instance()->loadAnn(annFile, charfile))
   {
      return false; 
   }

   if(!PlateJudge::instance()->loadSvm(svmFile))
   {
     return false;
   }

   return  true;
}

static bool plate_judge(const char* image, const char* model) {
  cv::Mat src = cv::imread(image);

  assert(!src.empty());

  int result;
  PlateJudge::instance()->plateJudge(src, result);

  return result == 1;
}

static void plate_locate(const char* image, const bool life_mode = true) {
  cv::Mat src = cv::imread(image);

  assert(!src.empty());

  CPlateLocate plate;
  plate.setDebug(1);
  plate.setLifemode(life_mode);

  std::vector<cv::Mat> results;

  plate.plateLocate(src, results);
}

static bool plate_recognize(std::vector<std::string>& results,
                            const char* image,
                            const bool life_mode = true) {


  cv::Mat img = cv::imread(image);
  if(img.empty())
  { 
   return false;
  }

  CPlateRecognize pr;
  pr.setLifemode(life_mode);
  pr.setDebug(false);

  
  if( pr.plateRecognize(img, results) == 0)
  {
    return true;
  }
  else
  {
     return false;
  }
 
}

static Color get_plate_color(const char* image) {
  cv::Mat img = cv::imread(image);

  assert(!img.empty());

  return getPlateType(img, true);
}
}
}

#endif  // EASYPR_API_HPP
