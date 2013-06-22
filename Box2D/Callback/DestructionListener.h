//
//  DestructionListener.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__DestructionListener__
#define __Box2D__DestructionListener__

#include <iostream>
#include <Block.h>
#include <Box2D/Box2D.h>

typedef void (^jointDestructionListenerSayGoodbyeCallback)(b2Joint *joint);
typedef void (^fixtureDestructionListenerSayGoodbyeCallback)(b2Fixture *fixture);

class DestructionListener : public b2DestructionListener
{
public:
  ~DestructionListener();
  jointDestructionListenerSayGoodbyeCallback GetJointSayGoodbye();
  void SetJointSayGoodbye(jointDestructionListenerSayGoodbyeCallback jointSayGoodbye);
  fixtureDestructionListenerSayGoodbyeCallback GetFixtureSayGoodbye();
  void SetFixtureSayGoodbye(fixtureDestructionListenerSayGoodbyeCallback fixtureSayGoodbye);
  
private:
  jointDestructionListenerSayGoodbyeCallback m_jointSayGoodbye;
  fixtureDestructionListenerSayGoodbyeCallback m_fixtureSayGoodbye;
  void SayGoodbye(b2Joint* joint);
  void SayGoodbye(b2Fixture* fixture);
};

inline jointDestructionListenerSayGoodbyeCallback DestructionListener::GetJointSayGoodbye()
{
  return m_jointSayGoodbye;
}

inline void DestructionListener::SetJointSayGoodbye(jointDestructionListenerSayGoodbyeCallback sayGoodbye)
{
  m_jointSayGoodbye = Block_copy(sayGoodbye);
}

inline fixtureDestructionListenerSayGoodbyeCallback DestructionListener::GetFixtureSayGoodbye()
{
  return m_fixtureSayGoodbye;
}

inline void DestructionListener::SetFixtureSayGoodbye(fixtureDestructionListenerSayGoodbyeCallback sayGoodbye)
{
  m_fixtureSayGoodbye = Block_copy(sayGoodbye);
}

#endif /* defined(__Box2D__DestructionListener__) */
