//
//  B2DCircleShapeTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DCircleShapeTest.h"
#import "B2DCircleShape.h"

@implementation B2DCircleShapeTest

- (void)testInitWithRadius
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:32];
  STAssertTrue(shape.shape != NULL, nil);
}


#pragma mark - Properties

- (void)testVertexCount
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:32];
  STAssertEquals(shape.vertexCount, (NSInteger)1, nil);
}

- (void)testPosition
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:32];
  
  STAssertTrue(CGPointEqualToPoint(shape.position, CGPointMake(0, 0)), nil);
}

#pragma mark - Methods

- (void)testGetSupport
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:32];
  
  NSInteger support = [shape getSupport:CGPointMake(0, 0)];
  STAssertEquals(support, (NSInteger)0, nil);
}

- (void)testGetSupportVertex
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:32];
  
  CGPoint supportVertex = [shape getSupportVertex:CGPointMake(0, 0)];
  STAssertTrue(CGPointEqualToPoint(supportVertex, CGPointMake(0, 0)), nil);
}

- (void)testGetVertex
{
  B2DCircleShape *shape = [[B2DCircleShape alloc] initWithRadius:1];
  
  CGPoint vertex = [shape getVertex:0];
  STAssertTrue(CGPointEqualToPoint(vertex, CGPointMake(0, 0)), nil);
}

@end
