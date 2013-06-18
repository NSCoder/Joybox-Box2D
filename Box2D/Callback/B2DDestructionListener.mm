//
//  B2DDestructionListener.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DDestructionListener.h"
#import "B2DFixture.h"

@interface B2DDestructionListener ()

- (void)setupCallbacks;

@end


@implementation B2DDestructionListener

@synthesize destructionListener;
@synthesize fixtureSayGoodbye;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.destructionListener = new DestructionListener();
    [self setupCallbacks];
  }
  
  return self;
}

- (void)setupCallbacks
{
  self.destructionListener->fixtureSayGoodbye = [^(b2Fixture *boxFixture)
                                                 {
                                                   if (self.fixtureSayGoodbye != nil)
                                                   {
                                                     B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
                                                     return self.fixtureSayGoodbye(fixture);
                                                   }
                                                 } copy];
}


@end
