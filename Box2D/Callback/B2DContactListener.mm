//
//  B2DContactListener.mm
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DContactListener.h"
#import "ContactListener.h"

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


- (void)setupCallbacks
{
  
  self.contactListener->beginContact = [^(b2Contact *contact)
                                        {
                                          if (self.beginContact != nil)
                                          {
                                            B2DBody *firstBody = nil;
                                            B2DBody *secondBody = nil;
                                            
                                            void* firstBodyUserData = contact->GetFixtureA()->GetBody()->GetUserData();
                                            
                                            if (firstBodyUserData != NULL)
                                            {
                                              firstBody = (B2DBody *)firstBodyUserData;
                                            }
                                            
                                            void* secondBodyUserData = contact->GetFixtureB()->GetBody()->GetUserData();
                                            
                                            if (secondBodyUserData)
                                            {
                                              secondBody = (B2DBody *)secondBodyUserData;
                                            }
                                            
                                            self.beginContact(firstBody, secondBody, contact->IsTouching());
                                          }
                                          
                                        } copy];
  
  
  self.contactListener->endContact = [^(b2Contact *contact)
                                      {
                                        if (self.endContact != nil)
                                        {
                                          B2DBody *firstBody = nil;
                                          B2DBody *secondBody = nil;
                                          
                                          void* firstBodyUserData = contact->GetFixtureA()->GetBody()->GetUserData();
                                          
                                          if (firstBodyUserData != NULL)
                                          {
                                            firstBody = (B2DBody *)firstBodyUserData;
                                          }
                                          
                                          void* secondBodyUserData = contact->GetFixtureB()->GetBody()->GetUserData();
                                          
                                          if (secondBodyUserData)
                                          {
                                            secondBody = (B2DBody *)secondBodyUserData;
                                          }
                                          
                                          self.endContact(firstBody, secondBody);
                                        }
                                      } copy];
}


- (void)dealloc
{
  [self.beginContact release];
  self.beginContact = nil;
  
  [self.endContact release];
  self.endContact = nil;
  
  delete self.contactListener;
  self.contactListener = nil;
  
  [super dealloc];
}


@end
