//
//  BGRAVideoFrame.h
//  airUI
//
//  Created by Sandeep on 8/23/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#ifndef __airUI___BGRAVideoFrame_h
#define __airUI___BGRAVideoFrame_h

#include <cstddef>

// A helper struct presenting interleaved BGRA image in memory.
struct BGRAVideoFrame
{
    size_t width;
    size_t height;
    size_t stride;
    
    unsigned char * data;
};


#endif