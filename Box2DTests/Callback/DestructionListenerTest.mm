//
//  DestructionListenerTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "DestructionListenerTest.h"
#import "DestructionListener.h"

@implementation DestructionListenerTest

- (void)testDestructor
{
  DestructionListener *destructionListener = new DestructionListener();
  destructionListener->SetJointSayGoodbye(^(b2Joint *joint) {});
  destructionListener->SetFixtureSayGoodbye(^(b2Fixture *fixture) {});
  
  delete destructionListener;
  STAssertTrue(destructionListener->GetJointSayGoodbye() == NULL, nil);
  STAssertTrue(destructionListener->GetFixtureSayGoodbye() == NULL, nil);
}

@end
