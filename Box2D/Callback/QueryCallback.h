//
//  B2DQueryCallback.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__B2DQueryCallback__
#define __Box2D__B2DQueryCallback__

#include <iostream>
#include <Block.h>
#include <Box2D/Box2D.h>

typedef bool (^queryCallbackReportFixtureCallback)(b2Fixture *fixture);

class QueryCallback : public b2QueryCallback
{
public:
  ~QueryCallback();
  queryCallbackReportFixtureCallback GetReportFixture();
  void SetReportFixture(queryCallbackReportFixtureCallback reportFixture);

private:
  queryCallbackReportFixtureCallback m_reportFixture;
  bool ReportFixture(b2Fixture* fixture);
};

inline queryCallbackReportFixtureCallback QueryCallback::GetReportFixture()
{
  return m_reportFixture;
}

inline void QueryCallback::SetReportFixture(queryCallbackReportFixtureCallback reportFixture)
{
  m_reportFixture = Block_copy(reportFixture);
}

#endif /* defined(__Box2D__B2DQueryCallback__) */
