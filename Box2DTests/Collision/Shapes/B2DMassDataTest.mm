//
//  B2DMassDataTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DMassDataTest.h"
#import "B2DMassData.h"

@implementation B2DMassDataTest

- (void)testB2DMassDataMake
{
  B2DMassData *massData = [[B2DMassData alloc] init];
  massData.mass = 1;
  massData.centre = CGPointMake(1, 1);
  massData.I = 1;
  
  STAssertEquals(massData.mass, (Float32)1, nil);
  STAssertTrue(CGPointEqualToPoint(massData.centre, CGPointMake(1, 1)), nil);
  STAssertEquals(massData.I, (Float32)1, nil);
}

@end
