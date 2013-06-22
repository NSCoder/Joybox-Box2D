//
//  ContactFilterTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/22/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "ContactFilterTest.h"
#import "ContactFilter.h"

@implementation ContactFilterTest

- (void)testDestructor
{
  ContactFilter *contactFilter = new ContactFilter();
  contactFilter->SetShouldCollide(^(b2Fixture *boxFixtureA, b2Fixture *boxFixtureB) { return true; });
  delete contactFilter;
  STAssertTrue(contactFilter->GetShouldCollide() == NULL, nil);
}

@end
