//
//  B2DPolygonShapeTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DPolygonShapeTest.h"
#import "B2DPolygonShape.h"

@implementation B2DPolygonShapeTest

- (void)testInitWithVerticesAndVertexCount
{
  CGPoint *vertices = new CGPoint[3];
  vertices[0] = CGPointMake(0, 0);
  vertices[1] = CGPointMake(1, 1);
  vertices[2] = CGPointMake(0, 1);
  
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithVertices:vertices andVertexCount:3];
  STAssertTrue(shape.shape != NULL, nil);
  STAssertEquals(shape.vertexCount, (NSInteger)3, nil);
}

- (void)testInitWithHalfWidthAndHalfHeight
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  STAssertTrue(shape.shape != NULL, nil);
  STAssertEquals(shape.vertexCount, (NSInteger)4, nil);
}

- (void)testInitWithHalfWidthHalfHeightCenterAndAngle
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 halfHeight:1 center:CGPointMake(1, 1) andAngle:1];
  STAssertTrue(shape.shape != NULL, nil);
  STAssertEquals(shape.vertexCount, (NSInteger)4, nil);
  STAssertTrue(CGPointEqualToPoint(shape.centroid, CGPointMake(1, 1)), nil);
}


#pragma mark - Properties

- (void)testVertexCount
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  STAssertEquals(shape.vertexCount, (NSInteger)4, nil);
}

- (void)testCentroid
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  STAssertTrue(CGPointEqualToPoint(shape.centroid, CGPointMake(0, 0)), nil);
}

- (void)testVertices
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  STAssertTrue(shape.vertices != NULL, nil);
}

- (void)testNormals
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  STAssertTrue(shape.normals != NULL, nil);
}


#pragma mark - Methods

- (void)testGetVertex
{
  B2DPolygonShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:1 andHalfHeight:1];
  
  CGPoint vertex = [shape getVertex:0];
  STAssertTrue(CGPointEqualToPoint(vertex, CGPointMake(-1, -1)), nil);
}

@end
