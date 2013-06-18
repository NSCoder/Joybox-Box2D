//
//  RayCastCallback.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__RayCastCallback__
#define __Box2D__RayCastCallback__

#include <iostream>
#include <Box2D/Box2D.h>

typedef float32 (^rayCastCallbackReportFixtureCallback)(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction);

class RayCastCallback : public b2RayCastCallback
{
public:
  rayCastCallbackReportFixtureCallback reportFixture;
  float32 ReportFixture(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction);
};

#endif /* defined(__Box2D__RayCastCallback__) */
