//
//  DestructionListener.h
//  Box2D
//
//  Created by Juan José Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__DestructionListener__
#define __Box2D__DestructionListener__

#include <iostream>
#include <Box2D/Box2D.h>

typedef void (^jointDestructionListenerSayGoodbyeCallback)(b2Joint *fixture);
typedef void (^fixtureDestructionListenerSayGoodbyeCallback)(b2Fixture *fixture);

class DestructionListener : public b2DestructionListener
{
public:
  
  DestructionListener()
  {
    jointSayGoodbye = NULL;
    fixtureSayGoodbye = NULL;
  }
  
  jointDestructionListenerSayGoodbyeCallback jointSayGoodbye;
  fixtureDestructionListenerSayGoodbyeCallback fixtureSayGoodbye;
  void SayGoodbye(b2Joint* joint);
  void SayGoodbye(b2Fixture* fixture);
};

#endif /* defined(__Box2D__DestructionListener__) */
