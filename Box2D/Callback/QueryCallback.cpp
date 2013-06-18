//
//  B2DQueryCallback.cpp
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "QueryCallback.h"

bool QueryCallback::ReportFixture(b2Fixture* fixture)
{
  if (reportFixture != NULL)
  {
    return reportFixture(fixture);
  }
  else
  {
    return false;
  }
}