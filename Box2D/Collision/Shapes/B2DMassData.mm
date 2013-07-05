//
//  B2DMassData.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DMassData.h"

@implementation B2DMassData

@synthesize mass;
@synthesize centre;
@synthesize I;

- (id)initWithMassData:(b2MassData)boxMassData
{
  self = [super init];
  
  if (self)
  {
    self.mass = boxMassData.mass;
    self.centre = CGPointFromVector(boxMassData.center);
    self.I = boxMassData.I;
  }
  
  return self;
}

@end
