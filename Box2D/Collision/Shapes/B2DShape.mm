//
//  B2DShape.mm
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DShape.h"

@implementation B2DShape

@synthesize shape;
@dynamic type;
@dynamic childCount;
@dynamic radius;

- (id)initWithShape:(b2Shape *)boxShape
{
  self = [super init];
  
  if (self)
  {
    self.shape = boxShape;
  }
  
  return self;
}

- (void)dealloc
{
  delete shape;
  shape = nil;
    
  [super dealloc];
}


#pragma mark - Properties

- (B2DShapeTypes)type
{
  return (B2DShapeTypes)self.shape->GetType();
}

- (NSInteger)childCount
{
  return (NSInteger)self.shape->GetChildCount();
}

- (CGFloat)radius
{
  return self.shape->m_radius;
}


#pragma mark - Methods

- (BOOL)testPointWithTransform:(B2DTransform)transform andPoint:(CGPoint)point
{
  b2Transform boxTransform = b2Transform();
  boxTransform.Set(b2Vec2FromPoint(transform.position), transform.angle);
  return self.shape->TestPoint(boxTransform, b2Vec2FromPoint(point));
}

- (BOOL)rayCastWithOutput:(B2DRayCastOutput *)output
                    input:(B2DRayCastInput)input
                transform:(B2DTransform)transform
                 andChildren:(NSInteger)childIndex
{
  b2RayCastOutput boxOutput;
  boxOutput.normal = b2Vec2FromPoint(output->normal);
  boxOutput.fraction = output->fraction;
  
  b2RayCastInput boxInput;
  boxInput.p1 = b2Vec2FromPoint(input.point1);
  boxInput.p2 = b2Vec2FromPoint(input.point2);
  boxInput.maxFraction = input.maxFraction;
  
  b2Transform boxTransform = b2Transform();
  boxTransform.Set(b2Vec2FromPoint(transform.position), transform.angle);
  
  BOOL rayCast = self.shape->RayCast(&boxOutput, boxInput, boxTransform, (int32)childIndex);
  output->normal = CGPointFromVector(boxOutput.normal);
  output->fraction = boxOutput.fraction;
  
  return rayCast;
}

- (void)computeAABB:(B2DAABB *)aabb withTransform:(B2DTransform)transform andChildIndex:(NSInteger)childIndex
{
  b2AABB boxAABB;
  boxAABB.lowerBound = b2Vec2FromPoint(aabb->lowerBound);
  boxAABB.upperBound = b2Vec2FromPoint(aabb->upperBound);
  
  b2Transform boxTransform = b2Transform();
  boxTransform.Set(b2Vec2FromPoint(transform.position), transform.angle);
  
  self.shape->ComputeAABB(&boxAABB, boxTransform, (int32)childIndex);
  
  aabb->lowerBound = CGPointFromVector(boxAABB.lowerBound);
  aabb->upperBound = CGPointFromVector(boxAABB.upperBound);
}

- (void)computeMass:(B2DMassData *)massData withDensity:(CGFloat)density
{
  b2MassData boxMassData;
  boxMassData.mass = massData->mass;
  boxMassData.center = b2Vec2FromPoint(massData->center);
  boxMassData.I = massData->rotationalInertia;
  
  self.shape->ComputeMass(&boxMassData, density);
  
  massData->mass = boxMassData.mass;
  massData->center = CGPointFromVector(boxMassData.center);
  massData->rotationalInertia = boxMassData.I;
}

@end
