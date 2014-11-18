//
//  ViewController.m
//  App3
//
//  Created by Sandeep on 8/24/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "ViewController.h"
#import "PostcardPrinter.hpp"
#import "opencv2/highgui/ios.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label;

@end

@implementation ViewController

@synthesize imageView;
@synthesize Label ;

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait ;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    PostcardPrinter::Parameters params ;
    
    UIImage *image = [UIImage imageNamed:@"lean.png"];
    UIImageToMat(image, params.face);
  
    
    image = [UIImage imageNamed:@"texture.jpg"];
    UIImageToMat(image, params.texture);
    cvtColor(params.texture, params.texture , CV_RGBA2RGB);
    
    image = [UIImage imageNamed:@"text.png"];
    UIImageToMat(image, params.text,true);
    
    PostcardPrinter postcardPrinter(params);
    
    
    cv::Mat postcard ;
    int64 timeStart = cv::getTickCount();
    postcardPrinter.print(postcard);
    int64 timeEnd = cv::getTickCount();
    float durationMs =
    1000.f * float(timeEnd - timeStart) / cv::getTickFrequency();
    NSLog(@"Printing time = %.3fms", durationMs);
    Label.text = [NSString stringWithFormat:@"Printing time = %.3f", durationMs];
    
    if(!postcard.empty())
        imageView.image = MatToUIImage(postcard);
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





@end
