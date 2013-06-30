//
//  Draw.h
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef __Box2D__Draw__
#define __Box2D__Draw__

#include <iostream>
#include <Block.h>
#include <Box2D/Box2D.h>

typedef void (^drawDrawPolygonCallback) (const b2Vec2 *vertices, int32 vertexCount, const b2Color& color);
typedef void (^drawDrawSolidPolygonCallback) (const b2Vec2 *vertices, int32 vertexCount, const b2Color& color);
typedef void (^drawDrawCircleCallback) (const b2Vec2& center, float32 radius, const b2Color& color);
typedef void (^drawDrawSolidCircleCallback) (const b2Vec2& center, float32 radius, const b2Color& color);
typedef void (^drawDrawSegmentCallback) (const b2Vec2& point1, const b2Vec2& point2, const b2Color& color);
typedef void (^drawDrawTransformCallback) (const b2Transform& transform);

class Draw : public b2Draw
{
public:
  Draw();
  ~Draw();
  drawDrawPolygonCallback GetDrawPolygon();
  void SetDrawPolygon(drawDrawPolygonCallback drawPolygon);
  drawDrawSolidPolygonCallback GetDrawSolidPolygon();
  void SetDrawSolidPolygon(drawDrawSolidPolygonCallback drawSolidPolygon);
  drawDrawCircleCallback GetDrawCircle();
  void SetDrawCircle(drawDrawCircleCallback drawCircle);
  drawDrawSolidCircleCallback GetDrawSolidCircle();
  void SetDrawSolidCircle(drawDrawSolidCircleCallback drawSolidCircle);
  drawDrawSegmentCallback GetDrawSegment();
  void SetDrawSegment(drawDrawSegmentCallback drawSegment);
  drawDrawTransformCallback GetDrawTransform();
  void SetDrawTransform(drawDrawTransformCallback drawTransform);
  
private:
  drawDrawPolygonCallback m_drawPolygon;
  drawDrawSolidPolygonCallback m_drawSolidPolygon;
  drawDrawCircleCallback m_drawCircle;
  drawDrawSolidCircleCallback m_drawSolidCircle;
  drawDrawSegmentCallback m_drawSegment;
  drawDrawTransformCallback m_drawTransform;
  void DrawPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color);
  void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount, const b2Color& color);
  void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color);
  void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis, const b2Color& color);
  void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color);
  void DrawTransform(const b2Transform& xf);
};

inline drawDrawPolygonCallback Draw::GetDrawPolygon()
{
  return m_drawPolygon;
}

inline void Draw::SetDrawPolygon(drawDrawPolygonCallback drawPolygon)
{
  m_drawPolygon = Block_copy(drawPolygon);
}

inline drawDrawSolidPolygonCallback Draw::GetDrawSolidPolygon()
{
  return m_drawSolidPolygon;
}

inline void Draw::SetDrawSolidPolygon(drawDrawSolidPolygonCallback drawSolidPolygon)
{
  m_drawSolidPolygon = Block_copy(drawSolidPolygon);
}

inline drawDrawCircleCallback Draw::GetDrawCircle()
{
  return m_drawCircle;
}

inline void Draw::SetDrawCircle(drawDrawCircleCallback drawCircle)
{
  m_drawCircle = Block_copy(drawCircle);
}

inline drawDrawSolidCircleCallback Draw::GetDrawSolidCircle()
{
  return m_drawSolidCircle;
}

inline void Draw::SetDrawSolidCircle(drawDrawSolidCircleCallback drawSolidCircle)
{
  m_drawSolidCircle = Block_copy(drawSolidCircle);
}

inline drawDrawSegmentCallback Draw::GetDrawSegment()
{
  return m_drawSegment;
}

inline void Draw::SetDrawSegment(drawDrawSegmentCallback drawSegment)
{
  m_drawSegment = Block_copy(drawSegment);
}

inline drawDrawTransformCallback Draw::GetDrawTransform()
{
  return m_drawTransform;
}

inline void Draw::SetDrawTransform(drawDrawTransformCallback drawTransform)
{
  m_drawTransform = Block_copy(drawTransform);
}

#endif /* defined(__Box2D__Draw__) */
