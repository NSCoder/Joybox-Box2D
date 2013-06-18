//
//  ContactFilter.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "ContactFilter.h"

bool ContactFilter::ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB)
{
  if (shouldCollide != NULL)
  {
    return shouldCollide(fixtureA, fixtureB);
  }
  else
  {
    return true;
  }
}