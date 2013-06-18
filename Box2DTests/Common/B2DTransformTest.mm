//
//  B2DTransformTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DTransformTest.h"
#import "B2DTransform.h"

@implementation B2DTransformTest

- (void)testB2DRayCastOutputMake
{
  B2DTransform transform = B2DTransformMake(CGPointMake(1, 1), 10);
  STAssertTrue(CGPointEqualToPoint(transform.position, CGPointMake(1, 1)), nil);
  STAssertEquals(transform.angle, (CGFloat)10, nil);
}

@end
