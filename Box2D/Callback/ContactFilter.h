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
#include <Box2D/Box2D.h>

typedef bool (^contactFilterShouldCollideCallback)(b2Fixture *fixtureA, b2Fixture *fixtureB);

class ContactFilter : public b2ContactFilter
{
public:
  contactFilterShouldCollideCallback shouldCollide;
  bool ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB);
};

#endif /* defined(__Box2D__ContactFilter__) */
