//
//  B2DQueryCallback.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "QueryCallback.h"

QueryCallback::~QueryCallback()
{
  Block_release(m_reportFixture);
  m_reportFixture = NULL;
}

bool QueryCallback::ReportFixture(b2Fixture* fixture)
{
  if (m_reportFixture != NULL)
  {
    return m_reportFixture(fixture);
  }
  else
  {
    return false;
  }
}