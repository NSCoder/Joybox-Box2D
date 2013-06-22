//
//  B2DContactFilter.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DContactFilter.h"
#import "B2DFixture.h"

@interface B2DContactFilter ()

- (void)setupCallbacks;

@end

@implementation B2DContactFilter

@synthesize contactFilter;
@synthesize shouldCollide;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.contactFilter = new ContactFilter();
    [self setupCallbacks];
  }
  
  return self;
}

- (void)dealloc
{
  [shouldCollide release];
  shouldCollide = nil;
  
  delete contactFilter;
  contactFilter = nil;
  
  [super dealloc];
}

- (void)setupCallbacks
{
  __block B2DContactFilter *weakSelf = self;  
  self.contactFilter->SetShouldCollide(^(b2Fixture *boxFixtureA, b2Fixture *boxFixtureB)
                                       {
                                         if (weakSelf.shouldCollide != nil)
                                         {
                                           B2DFixture *fixtureA = [[B2DFixture alloc] initWithFixture:boxFixtureA];
                                           B2DFixture *fixtureB = [[B2DFixture alloc] initWithFixture:boxFixtureB];
                                           return weakSelf.shouldCollide([fixtureA autorelease], [fixtureB autorelease]);
                                         }
                                         else
                                         {
                                           return true;
                                         }
                                       });
}

@end
