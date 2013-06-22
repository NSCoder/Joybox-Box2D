//
//  QueryCallbackTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "QueryCallbackTest.h"
#import "QueryCallback.h"

@implementation QueryCallbackTest

- (void)testDestructor
{
  QueryCallback *queryCallback = new QueryCallback();
  queryCallback->SetReportFixture(^(b2Fixture *fixture) { return true; });
  
  delete queryCallback;
  STAssertTrue(queryCallback->GetReportFixture() == NULL, nil);
}

@end