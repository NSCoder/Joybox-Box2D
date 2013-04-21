//
//  B2DCircleShape.m
//  Box2D
//
//  Created by Francisco Granados on 20/04/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DCircleShape.h"

@implementation B2DCircleShape

@synthesize shape;

- (id)initWithPosition:(CGPoint)point
{
  self = [super init];
  
  if (self)
  {
    b2CircleShape *circleShape = new b2CircleShape();
    
    circleShape->m_p = b2Vec2(point.x, point.y);
    
    self.shape = circleShape;
  }
  
  return self;}

@end