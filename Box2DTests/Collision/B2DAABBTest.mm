//
//  B2DAABBTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DAABBTest.h"
#import "B2DAABB.h"

@implementation B2DAABBTest

- (void)testB2DAABBMake
{
  B2DAABB aabb = B2DAABBMake(CGPointMake(0, 0), CGPointMake(1, 1));
  STAssertTrue(CGPointEqualToPoint(aabb.lowerBound, CGPointMake(0, 0)), nil);
  STAssertTrue(CGPointEqualToPoint(aabb.upperBound, CGPointMake(1, 1)), nil);
}

@end
