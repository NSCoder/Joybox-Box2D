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
#include <Block.h>
#include <Box2D/Box2D.h>

typedef void (^contactListenerBeginContactCallback)(b2Contact *contact);
typedef void (^contactListenerEndContactCallback)(b2Contact *contact);
typedef void (^contactListenerPreSolveCallback)(b2Contact *contact, const b2Manifold *mainfold);
typedef void (^contactListenerPostSolveCallback)(b2Contact *contact, const b2ContactImpulse *impulse);

class ContactListener : public b2ContactListener
{
public:
  ~ContactListener();
  contactListenerBeginContactCallback GetBeginContact();
  void SetBeginContact(contactListenerBeginContactCallback beginContact);
  contactListenerEndContactCallback GetEndContact();
  void SetEndContact(contactListenerEndContactCallback endContact);
  contactListenerPreSolveCallback GetPreSolve();
  void SetPreSolve(contactListenerPreSolveCallback preSolve);
  contactListenerPostSolveCallback GetPostSolve();
  void SetPostSolve(contactListenerPostSolveCallback postSolve);
  
private:
  contactListenerBeginContactCallback m_beginContact;
  contactListenerEndContactCallback m_endContact;
  contactListenerPreSolveCallback m_preSolve;
  contactListenerPostSolveCallback m_postSolve;
  void BeginContact(b2Contact *contact);
  void EndContact(b2Contact *contact);
  void PreSolve(b2Contact *contact, const b2Manifold *oldManifold);
  void PostSolve(b2Contact *contact, const b2ContactImpulse *impulse);
};

inline contactListenerBeginContactCallback ContactListener::GetBeginContact()
{
  return m_beginContact;
}

inline void ContactListener::SetBeginContact(contactListenerBeginContactCallback beginContact)
{
  m_beginContact = Block_copy(beginContact);
}

inline contactListenerEndContactCallback ContactListener::GetEndContact()
{
  return m_endContact;
}

inline void ContactListener::SetEndContact(contactListenerEndContactCallback endContact)
{
  m_endContact = Block_copy(endContact);
}

inline contactListenerPreSolveCallback ContactListener::GetPreSolve()
{
  return m_preSolve;
}

inline void ContactListener::SetPreSolve(contactListenerPreSolveCallback preSolve)
{
  m_preSolve = Block_copy(preSolve);
}

inline contactListenerPostSolveCallback ContactListener::GetPostSolve()
{
  return m_postSolve;
}

inline void ContactListener::SetPostSolve(contactListenerPostSolveCallback postSolve)
{
  m_postSolve = Block_copy(postSolve);
}

#endif /* defined(__Box2D__B2DContactListener__) */
