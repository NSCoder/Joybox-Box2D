//
//  B2DFixtureDef.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixtureDef.h"

B2DFixtureDef B2DFixtureDefMake()
{
  B2DFixtureDef fixtureDefinition;
	fixtureDefinition.shape = nil;
	fixtureDefinition.userData = nil;
  fixtureDefinition.friction = 0.2f;
  fixtureDefinition.restitution = 0.0f;
  fixtureDefinition.density = 0.0f;
  fixtureDefinition.isSensor = false;
  
  return fixtureDefinition;
}