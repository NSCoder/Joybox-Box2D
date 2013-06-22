//
//  ContactFilter.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__ContactFilter__
#define __Box2D__ContactFilter__

#include <iostream>
#include <Block.h>
#include <Box2D/Box2D.h>

typedef bool (^contactFilterShouldCollideCallback)(b2Fixture *fixtureA, b2Fixture *fixtureB);

class ContactFilter : public b2ContactFilter
{
public:
  ~ContactFilter();
  contactFilterShouldCollideCallback GetShouldCollide();
  void SetShouldCollide(contactFilterShouldCollideCallback shouldCollide);
  
private:
  contactFilterShouldCollideCallback m_shouldCollide;
  bool ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB);
};

inline contactFilterShouldCollideCallback ContactFilter::GetShouldCollide()
{
  return m_shouldCollide;
}

inline void ContactFilter::SetShouldCollide(contactFilterShouldCollideCallback shouldCollide)
{
  m_shouldCollide = Block_copy(shouldCollide);
}

#endif /* defined(__Box2D__ContactFilter__) */
