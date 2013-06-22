//
//  B2DQueryCallbackTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DQueryCallbackTest.h"
#import "B2DQueryCallback.h"

@implementation B2DQueryCallbackTest

- (void)testInit
{
  B2DQueryCallback *queryCallback = [[B2DQueryCallback alloc] init];
  STAssertTrue(queryCallback.queryCallback != NULL, nil);
  STAssertTrue(queryCallback.queryCallback->GetReportFixture() != NULL, nil);
}

- (void)testDealloc
{
  B2DQueryCallback *queryCallback = [[B2DQueryCallback alloc] init];
  STAssertNoThrow([queryCallback release], nil);
}

@end