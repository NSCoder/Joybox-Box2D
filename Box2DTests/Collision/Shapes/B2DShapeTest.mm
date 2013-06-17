//
//  B2DShapeTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DShapeTest.h"
#import "B2DShape.h"

@implementation B2DShapeTest

- (void)testInitWithShape
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  STAssertTrue(shape.shape != NULL, nil);
}

#pragma mark - Properties

- (void)testType
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  STAssertEquals(shape.type, kCircleShapeType, nil);
}

- (void)testChildCount
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  STAssertEquals(shape.childCount, (NSInteger)1, nil);
}

- (void)testRadius
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  STAssertEquals(shape.radius, (CGFloat)10, nil);
}


#pragma mark - Methods

- (void)testPointWithTransformAndPoint
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DTransform transform = B2DTransform();
  transform.position = CGPointMake(0, 0);
  transform.angle = 0;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  STAssertTrue([shape testPointWithTransform:transform andPoint:CGPointMake(0, 0)], nil);
  STAssertFalse([shape testPointWithTransform:transform andPoint:CGPointMake(11, 11)], nil);
}

- (void)testRayCastWithOutputInputTransformChildren
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DRayCastOutput rayCastOutput = B2DRayCastOutputMake(CGPointMake(0, 0), 0);
  B2DRayCastInput rayCastInput = BB2DRayCastInputMake(CGPointMake(10, 10), CGPointMake(1, 1), 20);
  
  B2DTransform transform = B2DTransform();
  transform.position = CGPointMake(0, 0);
  transform.angle = 0;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  BOOL rayCast = [shape rayCastWithOutput:&rayCastOutput input:rayCastInput transform:transform children:0];
  
  STAssertTrue(rayCast, nil);
  STAssertFalse(CGPointEqualToPoint(rayCastOutput.normal, CGPointMake(0, 0)), nil);
  STAssertTrue(rayCastOutput.fraction != 0, nil);
}

- (void)testComputeAABBWithTransformAndChildIndex
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DAABB aabb = B2DAABBMake(CGPointMake(0, 0), CGPointMake(0, 0));
  
  B2DTransform transform = B2DTransform();
  transform.position = CGPointMake(0, 0);
  transform.angle = 0;
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  [shape computeAABB:&aabb withTransform:transform andChildIndex:0];
  STAssertTrue(CGPointEqualToPoint(aabb.lowerBound, CGPointMake(-10, -10)), nil);
  STAssertTrue(CGPointEqualToPoint(aabb.upperBound, CGPointMake(10, 10)), nil);
}

- (void)testComputeMassWithDensity
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  
  B2DMassData massData = B2DMassDataMake(0, CGPointMake(0, 0), 0);
  
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  [shape computeMass:&massData withDensity:1];
  STAssertTrue(massData.mass != 0, nil);
  STAssertTrue(CGPointEqualToPoint(massData.center, CGPointMake(0, 0)), nil);
  STAssertTrue(massData.rotationalInertia != 0, nil);
}

@end
