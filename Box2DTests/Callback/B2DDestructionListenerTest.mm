//
//  B2DDestructionListenerTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DDestructionListenerTest.h"
#import "B2DDestructionListener.h"

@implementation B2DDestructionListenerTest

- (void)testInit
{
  B2DDestructionListener *destructionListener = [[B2DDestructionListener alloc] init];
  STAssertTrue(destructionListener.destructionListener != NULL, nil);
  STAssertTrue(destructionListener.destructionListener->GetFixtureSayGoodbye() != NULL, nil);
}

- (void)testDealloc
{
  B2DDestructionListener *destructionListener = [[B2DDestructionListener alloc] init];
  STAssertNoThrow([destructionListener release], nil);
}

@end
