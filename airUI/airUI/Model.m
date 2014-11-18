//
//  Model.m
//  airUI
//
//  Created by Sandeep on 8/22/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "Model.h"


@interface Model()

@property( nonatomic) NSUInteger* score ;

@end

@implementation Model





-(void)IncreaseScoreBy1 
{
    _score = _score + 1  ;
}


@end
