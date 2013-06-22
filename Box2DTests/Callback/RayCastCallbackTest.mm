//
//  RayCastCallbackTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "RayCastCallbackTest.h"
#import "RayCastCallback.h"

@implementation RayCastCallbackTest

- (void)testDestructor
{
  RayCastCallback *rayCastCallback = new RayCastCallback();
  rayCastCallback->SetReportFixture(^float32(b2Fixture *fixture, const b2Vec2 &point, const b2Vec2 &normal, float32 fraction) {
    return 0.0;
  });
  
  delete rayCastCallback;
  STAssertTrue(rayCastCallback->GetReportFixture() == NULL, nil);
}

@end