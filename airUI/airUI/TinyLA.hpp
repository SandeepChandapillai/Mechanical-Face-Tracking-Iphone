//
//  TinyLA.h
//  airUI
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#ifndef __airUI___TinyLA_hpp
#define __airUI___TinyLA_hpp

#include <vector>
#include <opencv2/opencv.hpp>

float perimeter(const std::vector<cv::Point2f> &a);

bool isInto(cv::Mat &contour, std::vector<cv::Point2f> &b);

#endif