//
//  ContactListenerTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "ContactListenerTest.h"
#import "ContactListener.h"

@implementation ContactListenerTest

- (void)testDestructor
{
  ContactListener *contactListener = new ContactListener();
  contactListener->SetBeginContact(^(b2Contact *contact) {});
  contactListener->SetEndContact(^(b2Contact *contact) {});
  contactListener->SetPreSolve(^(b2Contact *contact, const b2Manifold *mainfold) {});
  contactListener->SetPostSolve(^(b2Contact *contact, const b2ContactImpulse *impulse) {});
  
  delete contactListener;
  STAssertTrue(contactListener->GetBeginContact() == NULL, nil);
  STAssertTrue(contactListener->GetEndContact() == NULL, nil);
  STAssertTrue(contactListener->GetPreSolve() == NULL, nil);
  STAssertTrue(contactListener->GetPreSolve() == NULL, nil);
}

@end
