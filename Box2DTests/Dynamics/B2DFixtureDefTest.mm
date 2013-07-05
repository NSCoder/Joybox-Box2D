//
//  B2DFixtureDefTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixtureDefTest.h"
#import "B2DFixtureDef.h"

@implementation B2DFixtureDefTest

- (void)testB2DFixtureDefMake
{
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  STAssertEquals(fixtureDefinition.shape, (B2DShape *)nil, nil);
  STAssertEquals(fixtureDefinition.userData, (id)nil, nil);
  STAssertEquals(fixtureDefinition.friction, (CGFloat)0.2f, nil);
  STAssertEquals(fixtureDefinition.restitution, (CGFloat)0.0f, nil);
  STAssertEquals(fixtureDefinition.density, (CGFloat)0.0f, nil);
  STAssertFalse(fixtureDefinition.isSensor, nil);
}

@end