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
  B2DProfile *profile = [[B2DProfile alloc] init];
  profile.step = 1.0;
  profile.collide = 2.0;
  profile.solve = 3.0;
  profile.solveInit = 4.0;
  profile.solveVelocity = 5.0;
  profile.solvePosition = 6.0;
  profile.broadphase = 7.0;
  profile.solveTOI = 8.0;

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
