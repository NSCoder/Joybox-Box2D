//
//  B2DRayCastInput.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastInput.h"

@implementation B2DRayCastInput

@synthesize point1;
@synthesize point2;
@synthesize maxFraction;

- (id)initWithRayCastInput:(b2RayCastInput)rayCastInput
{
  self = [super init];
  
  if (self)
  {
    self.point1 = CGPointFromVector(rayCastInput.p1);
    self.point2 = CGPointFromVector(rayCastInput.p2);
    self.maxFraction = rayCastInput.maxFraction;
  }
  
  return self;
}

@end