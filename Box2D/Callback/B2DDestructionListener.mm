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

- (void)dealloc
{
  [fixtureSayGoodbye release];
  fixtureSayGoodbye = nil;
  
  delete destructionListener;
  destructionListener = nil;
  
  [super dealloc];
}

- (void)setupCallbacks
{
  __block B2DDestructionListener *weakSelf = self;
  self.destructionListener->SetFixtureSayGoodbye(^(b2Fixture *boxFixture)
                                                 {
                                                   if (weakSelf.fixtureSayGoodbye != nil)
                                                   {
                                                     B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
                                                     return weakSelf.fixtureSayGoodbye([fixture autorelease]);
                                                   }
                                                 });
}


@end
