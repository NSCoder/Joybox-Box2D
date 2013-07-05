//
//  B2DFilter.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFilter.h"

@implementation B2DFilter

@synthesize categoryBits;
@synthesize maskBits;
@synthesize groupIndex;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.categoryBits = 0x0001;
    self.maskBits = 0xFFFF;
    self.groupIndex = 0;
  }
  
  return self;
}

- (id)initWithFilter:(b2Filter)boxFilter
{
  self = [super init];
  
  if (self)
  {
    self.categoryBits = boxFilter.categoryBits;
    self.maskBits = boxFilter.maskBits;
    self.groupIndex = boxFilter.groupIndex;
  }
  
  return self;
}

@end