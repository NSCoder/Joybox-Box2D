//
//  B2DMassDataTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DMassDataTest.h"
#import "B2DMassData.h"

@implementation B2DMassDataTest

- (void)testB2DMassDataMake
{
  B2DMassData massData = B2DMassDataMake(1, CGPointMake(1, 1), 1);
  STAssertEquals(massData.mass, (CGFloat)1, nil);
  STAssertTrue(CGPointEqualToPoint(massData.center, CGPointMake(1, 1)), nil);
  STAssertEquals(massData.rotationalInertia, (CGFloat)1, nil);
}

@end
