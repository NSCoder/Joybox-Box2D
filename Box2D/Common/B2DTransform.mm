//
//  B2DTransform.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DTransform.h"

@implementation B2DTransform

@synthesize point;
@synthesize angle;

- (id)initWithTransform:(b2Transform)boxTransform
{
  self = [super init];
  
  if (self)
  {
    self.point = CGPointFromVector(boxTransform.p);
    self.angle = boxTransform.q.GetAngle();
  }
  
  return self;
}

@end
