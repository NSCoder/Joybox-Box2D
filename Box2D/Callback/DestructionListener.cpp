//
//  DestructionListener.cpp
//  Box2D
//
//  Created by Juan José Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "DestructionListener.h"

void DestructionListener::SayGoodbye(b2Joint* joint)
{
  if (jointSayGoodbye != NULL)
  {
    jointSayGoodbye(joint);
  }
}

void DestructionListener::SayGoodbye(b2Fixture* fixture)
{
  if (fixtureSayGoodbye != NULL)
  {
    fixtureSayGoodbye(fixture);
  }
}