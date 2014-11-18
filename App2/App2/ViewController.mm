//
//  ViewController.m
//  App2
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "opencv2/highgui/ios.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    NSString* cascadePath = [[NSBundle mainBundle]
                             pathForResource:@"cascade" ofType:@"xml"];
    
    faceDetector.load([cascadePath UTF8String]);
    
    UIImage* image = [UIImage imageNamed:@"lena.png"];
    cv::Mat faceImage ;
    UIImageToMat(image, faceImage);
    
    
    cv::Mat gray ;
    cvtColor(faceImage , gray , CV_BGR2GRAY);
    
    std::vector<cv::Rect> faces ;
    faceDetector.detectMultiScale(gray, faces,
                                  1.1, 2,
                                  0|CV_HAAR_SCALE_IMAGE,
                                  cv::Size(30,30));
 
    for(unsigned int i = 0 ; i < faces.size() ;i++)
    {
        const cv::Rect&face = faces[i];
        
        cv::Point tl(face.x, face.y);
        
        cv::Point br = tl+ cv::Point(face.width , face.height);
        
        
        cv::Scalar magenta = cv::Scalar(255,0,255);
        
        cv::rectangle(faceImage, tl, br, magenta,4,8,0);
        
        
    }
    
    
    imageView.image = MatToUIImage(faceImage);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
