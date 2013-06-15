//
//  B2DContactFilter.m
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
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

- (void)setupCallbacks
{
  self.contactFilter->shouldCollide = [^(b2Fixture *boxFixtureA, b2Fixture *boxFixtureB)
                                       {
                                         if (self.shouldCollide != nil)
                                         {
                                           B2DFixture *fixtureA = [[B2DFixture alloc] initWithFixture:boxFixtureA];
                                           B2DFixture *fixtureB = [[B2DFixture alloc] initWithFixture:boxFixtureB];
                                           return self.shouldCollide(fixtureA, fixtureB);
                                         }
                                         else
                                         {
                                           return YES;
                                         }
                                       } copy];
}

@end
