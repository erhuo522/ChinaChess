
#include "easypr.h"

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    const char* rootData =  "/Users/it/Documents/Easy_CPR";
    
    char strSVM[256];
    char strANN[256];
    char strChar[256];
    
    sprintf(strSVM, "%s/data/resources/model/svm.xml", rootData);
    sprintf(strANN, "%s/data/resources/model/ann.xml", rootData);
    sprintf(strChar, "%s/data/etc/province_mapping", rootData);
    
    if(easypr::api::init(strSVM, strANN, strChar))
    {
        char strImage[256];
        sprintf(strImage, "%s/data/resources/image/test.jpg", rootData);
        
        std::vector<std::string> results;
        if(easypr::api::plate_recognize(results, strImage))
        {
            //输出识别结果
            printf("识别结果：\n");
            for(int i=0;i<results.size(); i++)
            {
                printf("\t%s\n", results[0].c_str());
            }
        }
    }
    else
    {
    
        fprintf(stdout, "load model failed!\n");
    }
    
    return 0;
}
