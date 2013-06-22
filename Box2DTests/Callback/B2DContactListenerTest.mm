//
//  B2DContactListenerTest.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DContactListenerTest.h"
#import "B2DContactListener.h"

@implementation B2DContactListenerTest

- (void)testInit
{
  B2DContactListener *contactListener = [[B2DContactListener alloc] init];
  STAssertTrue(contactListener.contactListener != NULL, nil);
  STAssertTrue(contactListener.contactListener->GetBeginContact() != NULL, nil);
  STAssertTrue(contactListener.contactListener->GetEndContact() != NULL, nil);
}

- (void)testDealloc
{
  B2DContactListener *contactListener = [[B2DContactListener alloc] init];
  STAssertNoThrow([contactListener release], nil);
}

@end
