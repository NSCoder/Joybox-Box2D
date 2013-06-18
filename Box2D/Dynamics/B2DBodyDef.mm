//
//  B2DBodyDef.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DBodyDef.h"

B2DBodyDef B2DBodyDefMake()
{
  B2DBodyDef bodyDefinition;
  bodyDefinition.position = CGPointMake(0.0f, 0.0f);
  bodyDefinition.angle = 0.0f;
  bodyDefinition.linearVelocity = CGPointMake(0.0f, 0.0f);
  bodyDefinition.angularVelocity = 0.0f;
  bodyDefinition.linearDamping = 0.0f;
  bodyDefinition.angularDamping = 0.0f;
  bodyDefinition.allowSleep = true;
  bodyDefinition.awake = true;
  bodyDefinition.fixedRotation = false;
  bodyDefinition.bullet = false;
  bodyDefinition.type = kStaticBodyType;
  bodyDefinition.active = true;
  bodyDefinition.gravityScale = 1.0f;
  
  return bodyDefinition;
}