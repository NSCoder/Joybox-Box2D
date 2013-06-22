//
//  DestructionListener.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "DestructionListener.h"

DestructionListener::~DestructionListener()
{
  Block_release(m_jointSayGoodbye);
  m_jointSayGoodbye = NULL;
  Block_release(m_fixtureSayGoodbye);
  m_fixtureSayGoodbye = NULL;
}

void DestructionListener::SayGoodbye(b2Joint* joint)
{
  if (m_jointSayGoodbye != NULL)
  {
    m_jointSayGoodbye(joint);
  }
}

void DestructionListener::SayGoodbye(b2Fixture* fixture)
{
  if (m_fixtureSayGoodbye != NULL)
  {
    m_fixtureSayGoodbye(fixture);
  }
}