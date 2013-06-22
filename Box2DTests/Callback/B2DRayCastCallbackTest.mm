//
//  B2DRayCastCallbackTest.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastCallbackTest.h"
#import "B2DRayCastCallback.h"

@implementation B2DRayCastCallbackTest

- (void)testInit
{
  B2DRayCastCallback *rayCastCallback = [[B2DRayCastCallback alloc] init];
  STAssertTrue(rayCastCallback.rayCastCallback != NULL, nil);
  STAssertTrue(rayCastCallback.rayCastCallback->GetReportFixture() != NULL, nil);
}

- (void)testDealloc
{
  B2DRayCastCallback *rayCastCallback = [[B2DRayCastCallback alloc] init];
  STAssertNoThrow([rayCastCallback release], nil);
}

@end
