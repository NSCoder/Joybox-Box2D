//
//  RayCastCallback.cpp
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "RayCastCallback.h"

float32 RayCastCallback::ReportFixture(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction)
{
  if (reportFixture != NULL)
  {
    return reportFixture(fixture, point, normal, fraction);
  }
  else
  {
    return 0;
  }
}