//
//  B2DAABB.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DAABB.h"

@implementation B2DAABB

@synthesize lowerBound;
@synthesize upperBound;

- (id)initWithAABB:(b2AABB)aabb;
{
  self = [super init];
  
  if (self)
  {
    self.lowerBound = CGPointFromVector(aabb.lowerBound);
    self.upperBound = CGPointFromVector(aabb.upperBound);
  }
  
  return self;
}

@end