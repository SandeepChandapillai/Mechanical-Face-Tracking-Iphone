//
//  OpevCvTRY3.m
//  airUI
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "OpevCvTRY3.h"

@implementation OpevCvTRY3


UIImage * MatToUIImage(const cv::Mat& image)
{
    NSData *data = [NSData dataWithBytes:image.data length:image.elemSize()*image.total()];
    
    CGColorSpaceRef colorSpace;
    
    if (image.elemSize()) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    CGImageRef imageRef = CGImageCreate(image.cols, image.rows, 8, 8*image.elemSize(), image.step.p[0], colorSpace, kCGImageAlphaNone|kCGBitmapByteOrderDefault,provider, NULL, false , kCGRenderingIntentDefault);
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
  //  CGImageRelease(imageRef);
  //  CGDataProviderRelease(provider);
    //CGColorSpaceRelease(colorSpace);
    
    return finalImage ;
    
}


void UIImageToMat(const UIImage* image , cv::Mat &m , bool alphaExist = false )
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width , rows = image.size.height ;
    CGContextRef contextRef ;
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast;
    
    if(CGColorSpaceGetModel(colorSpace) == 0 )
    {
        m.create(rows, cols, CV_8UC1);
        bitmapInfo = kCGImageAlphaNone ;
            if(!alphaExist)
            bitmapInfo = kCGImageAlphaNone ;
            contextRef = CGBitmapContextCreate(m.data, m.cols, m.rows,8, m.step[0], colorSpace, bitmapInfo);
    }
    else
    {
        m.create(rows, cols, CV_8UC4);
        
            if(!alphaExist)
                bitmapInfo = kCGImageAlphaNoneSkipLast | kCGBitmapByteOrderDefault ;
                contextRef = CGBitmapContextCreate(m.data, m.cols, m.rows,8, m.step[0], colorSpace, bitmapInfo);
        
    }
        CGContextDrawImage(contextRef, CGRectMake(0,0,cols,rows), image.CGImage);
      //  CGContextRelease(contextRef);
    }
    
    
    


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"lena.png"];
  //  UIImageToMat(image,cvImage);
   

    UIImageToMat(image, cvImage);
    
    if(!cvImage.empty())
    {
        cv::Mat gray ;
        
        cv::cvtColor(cvImage, gray, cv::COLOR_RGBA2GRAY);
        
        cv::GaussianBlur(gray, gray, cv::Size(5,5), 1.2,1.2);
        
        
        cv::Mat edges ;
        cv::Canny(gray,edges,0,50);
        cvImage.setTo(cv::Scalar::all(255));
        
        cvImage.setTo(cv::Scalar(0,128,255,255),edges);
        
        _imageView.image = MatToUIImage(cvImage);
        
    }
    
}

@end
