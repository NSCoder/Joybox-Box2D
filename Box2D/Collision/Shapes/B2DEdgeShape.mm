//
//  B2DEdgeShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DEdgeShape.h"

@implementation B2DEdgeShape

- (id)initWithStartPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
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


- (void)dealloc
{
  [super dealloc];
}

@end
