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
#include <Block.h>
#include <Box2D/Box2D.h>

typedef float32 (^rayCastCallbackReportFixtureCallback)(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction);

class RayCastCallback : public b2RayCastCallback
{
public:
  ~RayCastCallback();
  rayCastCallbackReportFixtureCallback GetReportFixture();
  void SetReportFixture(rayCastCallbackReportFixtureCallback reportFixture);
  
private:
  rayCastCallbackReportFixtureCallback m_reportFixture;
  float32 ReportFixture(b2Fixture *fixture, const b2Vec2& point, const b2Vec2& normal, float32 fraction);
};

inline rayCastCallbackReportFixtureCallback RayCastCallback::GetReportFixture()
{
  return m_reportFixture;
}

inline void RayCastCallback::SetReportFixture(rayCastCallbackReportFixtureCallback reportFixture)
{
  m_reportFixture = Block_copy(reportFixture);
}

#endif /* defined(__Box2D__RayCastCallback__) */
