//
//  B2DContactListener.mm
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DContactListener.h"
#import "B2DBody.h"

@interface B2DContactListener ()

- (void)setupCallbacks;

@end

@implementation B2DContactListener

@synthesize contactListener;
@synthesize beginContact;
@synthesize endContact;


- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.contactListener = new ContactListener();
    
    [self setupCallbacks];
  }
  
  return self;
}

- (void)dealloc
{
  [beginContact release];
  beginContact = nil;
  
  [endContact release];
  endContact = nil;
  
  delete contactListener;
  contactListener = nil;
  
  [super dealloc];
}

- (void)setupCallbacks
{
  __block B2DContactListener *weakSelf = self;
  
  self.contactListener->SetBeginContact(^(b2Contact *contact)
                                        {
                                          if (weakSelf.beginContact != nil)
                                          {
                                            b2Body *firstBoxBody = contact->GetFixtureA()->GetBody();
                                            b2Body *secondBoxBody = contact->GetFixtureB()->GetBody();
                                            
                                            B2DBody *firstBody = [[B2DBody alloc] initWithBody:firstBoxBody];
                                            B2DBody *secondBody = [[B2DBody alloc] initWithBody:secondBoxBody];
                                            
                                            weakSelf.beginContact([firstBody autorelease], [secondBody autorelease], contact->IsTouching());
                                          }
                                        });
  
  self.contactListener->SetEndContact(^(b2Contact *contact)
                                      {
                                        if (weakSelf.endContact != nil)
                                        {
                                          b2Body *firstBoxBody = contact->GetFixtureA()->GetBody();
                                          b2Body *secondBoxBody = contact->GetFixtureB()->GetBody();
                                          
                                          B2DBody *firstBody = [[B2DBody alloc] initWithBody:firstBoxBody];
                                          B2DBody *secondBody = [[B2DBody alloc] initWithBody:secondBoxBody];
                                          
                                          weakSelf.endContact([firstBody autorelease], [secondBody autorelease]);
                                        }
                                      });
}


@end
