//
//  B2DColor.m
//  Box2D
//
//  Created by Juan José Karam on 7/4/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DColor.h"

@implementation B2DColor

@synthesize red;
@synthesize green;
@synthesize blue;

- (id)initWithColor:(b2Color)color
{
  self = [super init];
  
  if (self)
  {
    self.red = color.r;
    self.green = color.g;
    self.blue = color.b;
  }
  
  return self;
}

@end
