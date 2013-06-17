//
//  B2DEdgeShapeTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DEdgeShapeTest.h"
#import "B2DEdgeShape.h"

@implementation B2DEdgeShapeTest

- (void)testInitWithStartVertexEndVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertTrue(shape.shape != NULL, nil);
}


#pragma mark - Properties

- (void)testStartVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertTrue(CGPointEqualToPoint(shape.startVertex, startVertex), nil);
}

- (void)testEndVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertTrue(CGPointEqualToPoint(shape.endVertex, endVertex), nil);
}

- (void)testHasStartAdjacentVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertFalse(shape.hasStartAdjacentVertex, nil);
}

- (void)testStartAdjacentVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertTrue(CGPointEqualToPoint(shape.startAdjacentVertex, CGPointMake(0, 0)), nil);
}

- (void)testHasEndAdjacentVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertFalse(shape.hasEndAdjacentVertex, nil);
}

- (void)testEndAdjacentVertex
{
  CGPoint startVertex = CGPointMake(0, 0);
  CGPoint endVertex = CGPointMake(1, 1);
  B2DEdgeShape *shape = [[B2DEdgeShape alloc] initWithStartVertex:startVertex endVertex:endVertex];
  
  STAssertTrue(CGPointEqualToPoint(shape.endAdjacentVertex, CGPointMake(0, 0)), nil);
}
@end
