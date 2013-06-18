//
//  B2DQueryCallback.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DQueryCallback.h"
#import "B2DFixture.h"

@interface B2DQueryCallback ()

- (void)setupCallbacks;

@end

@implementation B2DQueryCallback

@synthesize queryCallback;
@synthesize reportFixture;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.queryCallback = new QueryCallback();
    [self setupCallbacks];
  }
  
  return self;
}

- (void)setupCallbacks
{
  self.queryCallback->reportFixture = [^(b2Fixture *boxFixture)
                                       {
                                         if (self.reportFixture != nil)
                                         {
                                           B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
                                           return self.reportFixture(fixture);
                                         }
                                         else
                                         {
                                           return YES;
                                         }
                                       } copy];
}

@end
