//
//  B2DFilter.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFilter.h"

B2DFilter B2DFilterMake()
{
  B2DFilter filter;
  filter.categoryBits = 0x0001;
  filter.maskBits = 0xFFFF;
  filter.groupIndex = 0;
  
  return filter;
}

B2DFilter B2DFilterMake(NSUInteger categoryBits, NSUInteger maskBits, NSInteger groupIndex)
{
  B2DFilter filter;
  filter.categoryBits = categoryBits;
  filter.maskBits = maskBits;
  filter.groupIndex = groupIndex;
  
  return filter;
}
