//
//  B2DContactListener.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 3/5/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "ContactListener.h"

ContactListener::~ContactListener()
{
  Block_release(m_beginContact);
  m_beginContact = NULL;
  Block_release(m_endContact);
  m_endContact = NULL;
  Block_release(m_preSolve);
  m_preSolve = NULL;
  Block_release(m_postSolve);
  m_postSolve = NULL;
}

void ContactListener::BeginContact(b2Contact *contact)
{
  if (m_beginContact != NULL)
  {
    m_beginContact(contact);
  }
}


void ContactListener::EndContact(b2Contact *contact)
{
  if (m_endContact != NULL)
  {
    m_endContact(contact);
  }
}


void ContactListener::PreSolve(b2Contact *contact, const b2Manifold *oldManifold)
{
  if (m_preSolve != NULL)
  {
    m_preSolve(contact, oldManifold);
  }
}


void ContactListener::PostSolve(b2Contact *contact, const b2ContactImpulse *impulse)
{
  if (m_postSolve != NULL)
  {
    m_postSolve(contact, impulse);
  }
}






