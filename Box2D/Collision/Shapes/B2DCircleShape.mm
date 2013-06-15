//
//  B2DCircleShape.mm
//  Box2D
//
//  Created by Kenichi Yonekawa on 13/04/24.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DCircleShape.h"

@implementation B2DCircleShape

@dynamic vertexCount;
@dynamic position;

- (id)initWithRadius:(CGFloat)radius
{
  self = [super init];
  
  if (self)
  {
    b2CircleShape *circleShape = new b2CircleShape();
    circleShape->m_radius = radius;
    self.shape = circleShape;
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
  return ((b2CircleShape *)self.shape)->GetVertexCount();
}

- (CGPoint)position
{
  return CGPointFromVector(((b2CircleShape *)self.shape)->m_p);
}


#pragma mark - Methods

- (NSInteger)getSupport:(CGPoint)direction
{
  return ((b2CircleShape *)self.shape)->GetSupport(b2Vec2FromPoint(direction));
}

- (CGPoint)getSupportVertex:(CGPoint)direction
{
  b2Vec2 vertex = ((b2CircleShape *)self.shape)->GetSupportVertex(b2Vec2FromPoint(direction));
  return CGPointFromVector(vertex);
}

- (CGPoint)getVertex:(NSInteger)index
{
  return CGPointFromVector(((b2PolygonShape *)self.shape)->GetVertex((int32)index));
}

@end
