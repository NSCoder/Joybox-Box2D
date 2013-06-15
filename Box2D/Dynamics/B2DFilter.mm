//
//  B2DFilter.m
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFilter.h"

B2DFilter B2DFilterMake(uint16 categoryBits, uint16 maskBits, int16 groupIndex)
{
  B2DFilter filter = B2DFilter();
  filter.categoryBits = categoryBits;
  filter.maskBits = maskBits;
  filter.groupIndex = groupIndex;
  
  return filter;
}
