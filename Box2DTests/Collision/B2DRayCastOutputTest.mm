//
//  B2DRayCastOutputTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastOutputTest.h"
#import "B2DRayCastOutput.h"

@implementation B2DRayCastOutputTest

- (void)testB2DRayCastOutputMake
{
  B2DRayCastOutput *rayCastOutput = [[B2DRayCastOutput alloc] init];
  rayCastOutput.normal = CGPointMake(1, 1);
  rayCastOutput.fraction = 10;
  
  STAssertTrue(CGPointEqualToPoint(rayCastOutput.normal, CGPointMake(1, 1)), nil);
  STAssertEquals(rayCastOutput.fraction, (Float32)10, nil);
}

@end
