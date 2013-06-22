//
//  RayCastCallback.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "RayCastCallback.h"

RayCastCallback::~RayCastCallback()
{
  Block_release(m_reportFixture);
  m_reportFixture = NULL;
}

float32 RayCastCallback::ReportFixture(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction)
{
  if (m_reportFixture != NULL)
  {
    return m_reportFixture(fixture, point, normal, fraction);
  }
  else
  {
    return 0;
  }
}