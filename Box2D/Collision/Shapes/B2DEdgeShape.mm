//
//  B2DEdgeShape.mm
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DEdgeShape.h"

@implementation B2DEdgeShape

@dynamic startVertex;
@dynamic endVertex;
@dynamic hasStartAdjacentVertex;
@dynamic startAdjacentVertex;
@dynamic hasEndAdjacentVertex;
@dynamic endAdjacentVertex;

- (id)init
{
  self = [super init];
  
  if (self)
  {   
    self.shape = new b2EdgeShape();
  }
  
  return self;
}

- (id)initWithStartVertex:(CGPoint)startVertex endVertex:(CGPoint)endVertex
{
  self = [super init];
  
  if (self)
  {
    b2EdgeShape *edgeShape = new b2EdgeShape();
    
    edgeShape->Set(b2Vec2FromPoint(startVertex), b2Vec2FromPoint(endVertex));
    
    self.shape = edgeShape;
  }
  
  return self;
}

- (void)dealloc
{
  [super dealloc];
}


#pragma mark - Properties

- (CGPoint)startVertex
{
  return CGPointFromVector(((b2EdgeShape *)self.shape)->m_vertex1);
}

- (CGPoint)endVertex
{
  return CGPointFromVector(((b2EdgeShape *)self.shape)->m_vertex2);
}

- (BOOL)hasStartAdjacentVertex
{
  return ((b2EdgeShape *)self.shape)->m_hasVertex0;
}

- (CGPoint)startAdjacentVertex
{
  return CGPointFromVector(((b2EdgeShape *)self.shape)->m_vertex0);
}

- (BOOL)hasEndAdjacentVertex
{
  return ((b2EdgeShape *)self.shape)->m_hasVertex3;
}

- (CGPoint)endAdjacentVertex
{
  return CGPointFromVector(((b2EdgeShape *)self.shape)->m_vertex3);
}


#pragma mark - Deprecated

- (id)initWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
  self = [super init];
  
  if (self)
  {
    b2EdgeShape *edgeShape = new b2EdgeShape();
    
    edgeShape->Set(b2Vec2(startPoint.x, startPoint.y),
                   b2Vec2(endPoint.x, endPoint.y));
    
    self.shape = edgeShape;
  }
  
  return self;
}



@end
