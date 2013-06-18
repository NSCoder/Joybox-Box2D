//
//  B2DProfileTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DProfileTest.h"
#import "B2DProfile.h"

@implementation B2DProfileTest

- (void)testB2DProfileMake
{
  B2DProfile profile = B2DProfileMake(1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f);
  STAssertEquals(profile.step, (CGFloat)1.0f, nil);
  STAssertEquals(profile.collide, (CGFloat)2.0f, nil);
  STAssertEquals(profile.solve, (CGFloat)3.0f, nil);
  STAssertEquals(profile.solveInit, (CGFloat)4.0f, nil);
  STAssertEquals(profile.solveVelocity, (CGFloat)5.0f, nil);
  STAssertEquals(profile.solvePosition, (CGFloat)6.0f, nil);
  STAssertEquals(profile.broadphase, (CGFloat)7.0f, nil);
  STAssertEquals(profile.solveTOI, (CGFloat)8.0f, nil);
}

@end
