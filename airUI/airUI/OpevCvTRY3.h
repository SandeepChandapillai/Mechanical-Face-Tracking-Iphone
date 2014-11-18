//
//  OpevCvTRY3.h
//  airUI
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import <opencv2/highgui.hpp>

#import <Foundation/Foundation.h>

@interface OpevCvTRY3 : UIViewController{
    cv::Mat cvImage ;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
