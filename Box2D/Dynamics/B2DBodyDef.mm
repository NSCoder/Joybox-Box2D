//
//  B2DBodyDef.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DBodyDef.h"

@implementation B2DBodyDef

@synthesize type;
@synthesize position;
@synthesize angle;
@synthesize linearVelocity;
@synthesize angularVelocity;
@synthesize linearDamping;
@synthesize angularDamping;
@synthesize allowSleep;
@synthesize awake;
@synthesize fixedRotation;
@synthesize bullet;
@synthesize active;
@synthesize gravityScale;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.position = CGPointMake(0.0f, 0.0f);
    self.angle = 0.0f;
    self.linearVelocity = CGPointMake(0.0f, 0.0f);
    self.angularVelocity = 0.0f;
    self.linearDamping = 0.0f;
    self.angularDamping = 0.0f;
    self.allowSleep = true;
    self.awake = true;
    self.fixedRotation = false;
    self.bullet = false;
    self.type = kStaticBodyType;
    self.active = true;
    self.gravityScale = 1.0f;
  }
  
  return self;
}

- (id)initWithBodyDef:(b2BodyDef)boxBodyDef
{
  self = [super init];
  
  if (self)
  {
    self.type = (B2DBodyTypes)boxBodyDef.type;
    self.position = CGPointFromVector(boxBodyDef.position);
    self.angle = boxBodyDef.angle;
    self.linearVelocity = CGPointFromVector(boxBodyDef.linearVelocity);
    self.angularVelocity = boxBodyDef.angularVelocity;
    self.linearDamping = boxBodyDef.linearDamping;
    self.angularDamping = boxBodyDef.angularDamping;
    self.allowSleep = boxBodyDef.allowSleep;
    self.awake = boxBodyDef.awake;
    self.fixedRotation = boxBodyDef.fixedRotation;
    self.bullet = boxBodyDef.bullet;
    self.active = boxBodyDef.active;
    self.gravityScale = boxBodyDef.gravityScale;
  }
  
  return self;
}

@end