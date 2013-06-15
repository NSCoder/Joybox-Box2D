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
  printf("Joint Death");
}

void DestructionListener::SayGoodbye(b2Fixture* fixture)
{
  printf("Fixture Death");
}