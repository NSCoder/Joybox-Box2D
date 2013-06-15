//
//  B2DContactListener.h
//  Box2D
//
//  Created by Juan Jose Karam on 3/5/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__B2DContactListener__
#define __Box2D__B2DContactListener__

#include <iostream>
#include <Box2D/Box2D.h>

typedef void (^contactListenerBeginContactCallback)(b2Contact *contact);
typedef void (^contactListenerEndContactCallback)(b2Contact *contact);
typedef void (^contactListenerPreSolveCallback)(b2Contact *contact, const b2Manifold *mainfold);
typedef void (^contactListenerPostSolveCallback)(b2Contact *contact, const b2ContactImpulse *impulse);

class ContactListener : public b2ContactListener
{
public:
  contactListenerBeginContactCallback beginContact;
  contactListenerEndContactCallback endContact;
  contactListenerPreSolveCallback preSolve;
  contactListenerPostSolveCallback postSolve;
  
private:
  void BeginContact(b2Contact *contact);
  void EndContact(b2Contact *contact);
  void PreSolve(b2Contact *contact, const b2Manifold *oldManifold);
  void PostSolve(b2Contact *contact, const b2ContactImpulse *impulse);
};

#endif /* defined(__Box2D__B2DContactListener__) */
