//
//  B2DColor.m
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DColor.h"

B2DColor B2DColorMake(CGFloat red, CGFloat green, CGFloat blue)
{
  B2DColor color;
  color.red = red;
  color.green = green;
  color.blue = blue;
  
  return color;
}