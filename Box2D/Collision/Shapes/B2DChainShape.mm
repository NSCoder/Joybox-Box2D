//
//  B2DChainShape.m
//  Box2D
//
//  Created by Francisco Granados on 20/04/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DChainShape.h"

@implementation B2DChainShape

@synthesize shape;

- (id)initWithLoop:(CGPoint)aVertices
          andCount:(NSInteger)count
{
  self = [super init];
  
  if (self)
  {
    b2ChainShape *chainShape = new b2ChainShape();
    
    b2Vec2 vertices = b2Vec2(aVertices.x, aVertices.y);

    chainShape->CreateLoop(&vertices, count);
    self.shape = chainShape;
  }
  
  return self;
}

- (id)initWithChain:(CGPoint)aVertices
           andCount:(NSInteger)count
{
  self = [super init];
  
  if (self)
  {
    b2ChainShape *chainShape = new b2ChainShape();
    
    b2Vec2 vertices = b2Vec2(aVertices.x, aVertices.y);
    
    chainShape->CreateChain(&vertices, count);

    self.shape = chainShape;
  }
  
  return self;
}

@end
