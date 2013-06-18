//
//  B2DChainShapeTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DChainShapeTest.h"
#import "B2DChainShape.h"
#import "B2DEdgeShape.h"

@implementation B2DChainShapeTest

#pragma mark - Properties

- (void)testVertexCount
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  STAssertEquals(shape.vertexCount, (NSInteger)3, nil);
}

- (void)testVertices
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  STAssertTrue(shape.vertices != NULL, nil);
}

- (void)testHasPreviousVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  STAssertFalse(shape.hasPreviousVertex, nil);
}

- (void)testHasNextVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  STAssertFalse(shape.hasNextVertex, nil);
}


#pragma mark - Methods

- (void)testCreateLoopWithVerticesAndVertexCount
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createLoopWithVertices:vertices andVertexCount:3];
  
  STAssertEquals(shape.vertexCount, (NSInteger)4, nil);
}

- (void)testCreateChainWithVerticesAndVertexCount
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  STAssertEquals(shape.vertexCount, (NSInteger)3, nil);
}

- (void)testPreviousVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  [shape setPreviousVertex:CGPointMake(-1, -1)];
  
  STAssertTrue(CGPointEqualToPoint([shape previousVertex], CGPointMake(-1, -1)), nil);
}

- (void)testSetPreviousVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  [shape setPreviousVertex:CGPointMake(-1, -1)];
  
  STAssertTrue(CGPointEqualToPoint([shape previousVertex], CGPointMake(-1, -1)), nil);
}

- (void)testNextVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  [shape setNextVertex:CGPointMake(2, 2)];
  
  STAssertTrue(CGPointEqualToPoint([shape nextVertex], CGPointMake(2, 2)), nil);
}

- (void)testSetNextVertex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  [shape setNextVertex:CGPointMake(2, 2)];
  
  STAssertTrue(CGPointEqualToPoint([shape nextVertex], CGPointMake(2, 2)), nil);
}

- (void)testGetChildEdgeWithIndex
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DChainShape *shape = [[B2DChainShape alloc] init];
  [shape createChainWithVertices:vertices andVertexCount:3];
  
  B2DEdgeShape *edgeShape = [[B2DEdgeShape alloc] init];
  [shape getChildEdge:edgeShape withIndex:0];
  
  STAssertTrue(CGPointEqualToPoint(edgeShape.startVertex, CGPointMake(0, 0)), nil);
  STAssertTrue(CGPointEqualToPoint(edgeShape.endVertex, CGPointMake(1, 1)), nil);
}

@end
