//
//  ContactFilter.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "ContactFilter.h"

ContactFilter::~ContactFilter()
{
  Block_release(m_shouldCollide);
  m_shouldCollide = NULL;
}

bool ContactFilter::ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB)
{
  if (m_shouldCollide != NULL)
  {
    return m_shouldCollide(fixtureA, fixtureB);
  }
  else
  {
    return true;
  }
}