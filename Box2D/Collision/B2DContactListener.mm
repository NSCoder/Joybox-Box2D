//
//  B2DContactListener.m
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DContactListener.h"
#import "ContactListener.h"

@interface B2DContactListener ()

- (void)setupCallbacks;

@end


@implementation B2DContactListener


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
                                              firstBody = (__bridge B2DBody *)firstBodyUserData;
                                            }
                                            
                                            void* secondBodyUserData = contact->GetFixtureB()->GetBody()->GetUserData();
                                            
                                            if (secondBodyUserData)
                                            {
                                              secondBody = (__bridge B2DBody *)secondBodyUserData;
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
                                            firstBody = (__bridge B2DBody *)firstBodyUserData;
                                          }
                                          
                                          void* secondBodyUserData = contact->GetFixtureB()->GetBody()->GetUserData();
                                          
                                          if (secondBodyUserData)
                                          {
                                            secondBody = (__bridge B2DBody *)secondBodyUserData;
                                          }
                                          
                                          self.endContact(firstBody, secondBody);
                                        }
                                      } copy];
}


- (void)dealloc
{
  delete self.contactListener;
}


@end
