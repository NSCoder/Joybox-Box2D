//
//  B2DContactListener.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 3/5/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "ContactListener.h"

void ContactListener::BeginContact(b2Contact *contact)
{
  if (beginContact != NULL)
  {
    beginContact(contact);
  }
}


void ContactListener::EndContact(b2Contact *contact)
{
  if (endContact != NULL)
  {
    endContact(contact);
  }
}


void ContactListener::PreSolve(b2Contact *contact, const b2Manifold *oldManifold)
{
  if (preSolve != NULL)
  {
    preSolve(contact, oldManifold);
  }
}


void ContactListener::PostSolve(b2Contact *contact, const b2ContactImpulse *impulse)
{
  if (postSolve != NULL)
  {
    postSolve(contact, impulse);
  }
}






