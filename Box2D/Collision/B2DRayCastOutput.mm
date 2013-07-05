//
//  B2DRayCastOutput.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastOutput.h"

@implementation B2DRayCastOutput

@synthesize normal;
@synthesize fraction;

- (id)initWithRayCastOutput:(b2RayCastOutput)rayCastOutput
{
  self = [super init];
  
  if (self)
  {
    self.normal = CGPointFromVector(rayCastOutput.normal);
    self.fraction = fraction;
  }
  
  return self;
}

@end