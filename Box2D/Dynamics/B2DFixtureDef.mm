//
//  B2DFixtureDef.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixtureDef.h"

@implementation B2DFixtureDef

@synthesize shape;
@synthesize userData;
@synthesize friction;
@synthesize restitution;
@synthesize density;
@synthesize isSensor;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.shape = nil;
    self.userData = nil;
    self.friction = 0.2f;
    self.restitution = 0.0f;
    self.density = 0.0f;
    self.isSensor = false;
  }
  
  return self;
}

@end