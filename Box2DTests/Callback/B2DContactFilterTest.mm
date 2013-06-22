//
//  B2DContactFilterTest.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DContactFilterTest.h"
#import "B2DContactFilter.h"

@implementation B2DContactFilterTest

- (void)testInit
{
  B2DContactFilter *contactFilter = [[B2DContactFilter alloc] init];
  STAssertTrue(contactFilter.contactFilter != NULL, nil);
  STAssertTrue(contactFilter.contactFilter->GetShouldCollide() != NULL, nil);
}

- (void)testDealloc
{
  B2DContactFilter *contactFilter = [[B2DContactFilter alloc] init];
  STAssertNoThrow([contactFilter release], nil);
}

@end
