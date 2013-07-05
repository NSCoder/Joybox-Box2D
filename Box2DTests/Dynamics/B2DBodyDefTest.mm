//
//  B2DBodyDefTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DBodyDefTest.h"
#import "B2DBodyDef.h"

@implementation B2DBodyDefTest

- (void)testB2DBodyDefMake
{
  B2DBodyDef * bodyDefinition = [[B2DBodyDef alloc] init];
  STAssertTrue(CGPointEqualToPoint(bodyDefinition.position, CGPointMake(0, 0)), nil);
  STAssertEquals(bodyDefinition.angle, (CGFloat)0.0, nil);
  STAssertTrue(CGPointEqualToPoint(bodyDefinition.linearVelocity, CGPointMake(0, 0)), nil);
  STAssertEquals(bodyDefinition.angularVelocity, (CGFloat)0.0, nil);
  STAssertEquals(bodyDefinition.linearDamping, (CGFloat)0.0, nil);
  STAssertEquals(bodyDefinition.angularDamping, (CGFloat)0.0, nil);
  STAssertTrue(bodyDefinition.allowSleep, nil);
  STAssertTrue(bodyDefinition.awake, nil);
  STAssertFalse(bodyDefinition.fixedRotation, nil);
  STAssertFalse(bodyDefinition.bullet, nil);
  STAssertEquals(bodyDefinition.type, kStaticBodyType, nil);
  STAssertTrue(bodyDefinition.active, nil);
  STAssertEquals(bodyDefinition.gravityScale, (CGFloat)1.0, nil);
}

@end
