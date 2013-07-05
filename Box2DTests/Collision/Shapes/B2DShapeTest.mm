//
//  B2DShapeTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DShapeTest.h"
#import "B2DShape.h"
#import "B2DTransform.h"
#import "B2DRayCastOutput.h"
#import "B2DRayCastInput.h"
#import "B2DAABB.h"
#import "B2DMassData.h"

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
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  
  B2DTransform *transform = [[B2DTransform alloc] init];
  transform.point = CGPointMake(0, 0);
  transform.angle = 0;
  
  STAssertTrue([shape testPointWithTransform:transform andPoint:CGPointMake(0, 0)], nil);
  STAssertFalse([shape testPointWithTransform:transform andPoint:CGPointMake(11, 11)], nil);
}

- (void)testRayCastWithOutputInputTransformChildren
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  
  B2DRayCastOutput *rayCastOutput = [[B2DRayCastOutput alloc] init];
  rayCastOutput.normal = CGPointMake(0, 0);
  rayCastOutput.fraction = 0;
  
  B2DRayCastInput *rayCastInput = [[B2DRayCastInput alloc] init];
  rayCastInput.point1 = CGPointMake(10, 10);
  rayCastInput.point2 = CGPointMake(1, 1);
  rayCastInput.maxFraction = 20;
  
  B2DTransform *transform = [[B2DTransform alloc] init];
  transform.point = CGPointMake(0, 0);
  transform.angle = 0;
  
  bool rayCast = [shape rayCastWithOutput:rayCastOutput input:rayCastInput transform:transform andChildren:0];
  
  STAssertTrue(rayCast, nil);
  STAssertFalse(CGPointEqualToPoint(rayCastOutput.normal, CGPointMake(0, 0)), nil);
  STAssertTrue(rayCastOutput.fraction != 0, nil);
}

- (void)testComputeAABBWithTransformAndChildIndex
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  
  B2DAABB *aabb = [[B2DAABB alloc] init];
  aabb.lowerBound = CGPointMake(0, 0);
  aabb.upperBound = CGPointMake(0, 0);
  
  B2DTransform *transform = [[B2DTransform alloc] init];
  transform.point = CGPointMake(1, 1);
  transform.angle = 0;
  
  [shape computeAABB:aabb withTransform:transform andChildIndex:0];
  
  STAssertTrue(CGPointEqualToPoint(aabb.lowerBound, CGPointMake(-9, -9)), nil);
  STAssertTrue(CGPointEqualToPoint(aabb.upperBound, CGPointMake(11, 11)), nil);
}

- (void)testComputeMassWithDensity
{
  b2CircleShape *circleShape = new b2CircleShape();
  circleShape->m_radius = 10;
  B2DShape *shape = [[B2DShape alloc] initWithShape:circleShape];
  
  B2DMassData *massData = [[B2DMassData alloc] init];
  massData.mass = 0;
  massData.centre = CGPointMake(0, 0);
  massData.I = 0;
  
  [shape computeMass:massData withDensity:1];
  
  STAssertTrue(massData.mass != 0, nil);
  STAssertTrue(CGPointEqualToPoint(massData.centre, CGPointMake(0, 0)), nil);
  STAssertTrue(massData.I != 0, nil);
}

@end
