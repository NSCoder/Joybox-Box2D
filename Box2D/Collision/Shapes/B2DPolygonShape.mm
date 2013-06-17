//
//  B2DPolygonShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 2/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DPolygonShape.h"

@implementation B2DPolygonShape

@dynamic vertexCount;
@dynamic centroid;
@dynamic vertices;
@dynamic normals;

- (id)initWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount
{
  self = [super init];
  
  if (self)
  {
    b2PolygonShape *polygonShape = new b2PolygonShape();
    
    b2Vec2 *boxVertices = new b2Vec2[vertexCount];
    
    for(int i = 0; i < vertexCount; i++)
    {
      CGPoint point = vertices[i];
      boxVertices[i] = b2Vec2FromPoint(point);
    }
    
    polygonShape->Set(boxVertices, (int32)vertexCount);
    
    self.shape = polygonShape;
  }
  
  return self;
}

- (id)initWithHalfWidth:(CGFloat)halfWidth andHalfHeight:(CGFloat)halfHeight
{
  self = [super init];
  
  if (self)
  {
    b2PolygonShape *polygonShape = new b2PolygonShape();
    polygonShape->SetAsBox(halfWidth, halfHeight);
    
    self.shape = polygonShape;
  }
  
  return self;
}

- (id)initWithHalfWidth:(CGFloat)halfWidth halfHeight:(CGFloat)halfHeight center:(CGPoint)center andAngle:(CGFloat)angle
{
  self = [super init];
  
  if (self)
  {
    b2PolygonShape *polygonShape = new b2PolygonShape();
    polygonShape->SetAsBox(halfWidth, halfHeight, b2Vec2FromPoint(center), angle);
    
    self.shape = polygonShape;
  }
  
  return self;
}

- (void)dealloc
{
  [super dealloc];
}


#pragma mark - Properties

- (NSInteger)vertexCount
{
  return ((b2PolygonShape *)self.shape)->GetVertexCount();
}

- (CGPoint)centroid
{
  return CGPointFromVector(((b2PolygonShape *)self.shape)->m_centroid);
}

- (CGPoint *)vertices
{
  CGPoint *vertices = new CGPoint[[self vertexCount]];
  
  for(int i = 0; i < [self vertexCount]; i ++)
  {
    vertices[i] = CGPointFromVector(((b2PolygonShape *)self.shape)->m_vertices[i]);
  }
  
  return vertices;
}

- (CGPoint *)normals
{
  CGPoint *normals = new CGPoint[[self vertexCount]];
  
  for(int i = 0; i < [self vertexCount]; i ++)
  {
    normals[i] = CGPointFromVector(((b2PolygonShape *)self.shape)->m_normals[i]);
  }
  
  return normals;
}


#pragma mark - Methods

- (CGPoint)getVertex:(NSInteger)index
{
  return CGPointFromVector(((b2PolygonShape *)self.shape)->GetVertex((int32)index));
}


#pragma mark - Deprecated

- (id)initWithBoxSize:(CGSize)boxSize
{
  self = [super init];
  
  if (self)
  {
    NSLog(@"Deprecated Method: Use initWithHalfWidth:andHalfHeight: instead.");
    
    b2PolygonShape *polygonShape = new b2PolygonShape();
    polygonShape->SetAsBox(boxSize.width, boxSize.height);
    
    self.shape = polygonShape;
  }
  
  return self;
}

@end
