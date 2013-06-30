//
//  Draw.cpp
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#include "Draw.h"

Draw::Draw()
{
  uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
  this->SetFlags(flags);
}

Draw::~Draw()
{
  Block_release(m_drawPolygon);
  m_drawPolygon = NULL;
  Block_release(m_drawSolidPolygon);
  m_drawSolidPolygon = NULL;
  Block_release(m_drawCircle);
  m_drawCircle = NULL;
  Block_release(m_drawSolidCircle);
  m_drawSolidCircle = NULL;
  Block_release(m_drawSegment);
  m_drawSegment = NULL;
  Block_release(m_drawTransform);
  m_drawTransform = NULL;
}

void Draw::DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color)
{
  if (m_drawPolygon != NULL)
  {
    m_drawPolygon(vertices, vertexCount, color);
  }
}

void Draw::DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color)
{
  if (m_drawSolidPolygon != NULL)
  {
    m_drawSolidPolygon(vertices, vertexCount, color);
  }
}

void Draw::DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color)
{
  if (m_drawCircle != NULL)
  {
    m_drawCircle(center, radius, color);
  }
}

void Draw::DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color)
{
  if (m_drawSolidCircle != NULL)
  {
    m_drawSolidCircle(center, radius, color);
  }
}

void Draw::DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color)
{
  if (m_drawSegment != NULL)
  {
    m_drawSegment(p1, p2, color);
  }
}

void Draw::DrawTransform(const b2Transform& xf)
{
  if (m_drawTransform != NULL)
  {
    m_drawTransform(xf);
  }
}