//
//  B2DFixture.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixture.h"
#import "B2DBody.h"
#import "B2DShape.h"

@implementation B2DFixture

@synthesize fixture;

- (id)initWithFixture:(b2Fixture *)boxFixture
{
  self = [super init];
  
  if (self)
  {
    self.fixture = boxFixture;
  }
  
  return self;
}


#pragma mark - Properties

- (B2DShapeTypes)type
{
  return (B2DShapeTypes)self.fixture->GetType();
}

- (B2DShape *)shape
{
  return [[B2DShape alloc] initWithShape:self.fixture->GetShape()];
}

- (BOOL)isSensor
{
  return self.fixture->IsSensor();
}

- (BOOL)sensor
{
  return [self isSensor];
}

- (void)setSensor:(BOOL)sensor
{
  self.fixture->SetSensor(sensor);
}

- (B2DFilter)filterData
{
  b2Filter filter = self.fixture->GetFilterData();
  return B2DFilterMake(filter.categoryBits, filter.maskBits, filter.groupIndex);
}

- (void)setFilterData:(B2DFilter)filterData
{
  b2Filter filter = b2Filter();
  filter.categoryBits = filterData.categoryBits;
  filter.maskBits = filterData.maskBits;
  filter.groupIndex = filterData.groupIndex;
  
  self.fixture->SetFilterData(filter);
}

- (B2DBody *)body
{
  return [[B2DBody alloc] initWithBody:self.fixture->GetBody()];
}

- (id)userData
{
  return (id)self.fixture->GetUserData();
}

- (void)setUserData:(id)userData
{
  self.fixture->SetUserData(userData);
}

- (CGFloat)density
{
  return self.fixture->GetDensity();
}

- (void)setDensity:(CGFloat)density
{
  self.fixture->SetDensity(density);
}

- (CGFloat)friction
{
  return self.fixture->GetFriction();
}

- (void)setFriction:(CGFloat)friction
{
  self.fixture->SetFriction(friction);
}

- (CGFloat)restitution
{
  return self.fixture->GetRestitution();
}

- (void)setRestitution:(CGFloat)restitution
{
  self.fixture->SetRestitution(restitution);
}


#pragma mark - Methods

- (void)refilter
{
  self.fixture->Refilter();
}

- (B2DFixture *)next
{
  b2Fixture *boxFixture = self.fixture->GetNext();
  
  if (boxFixture == NULL) { return nil; }
  
  return [[B2DFixture alloc] initWithFixture:boxFixture];
}

- (BOOL)testPoint:(CGPoint)point
{
  return self.fixture->TestPoint(b2Vec2FromPoint(point));
}

// Check this method with the &
- (BOOL)rayCastWithOutput:(B2DRayCastOutput)output input:(B2DRayCastInput)input andChildIndex:(NSInteger)childIndex
{
  b2RayCastOutput boxOutput;
  boxOutput.normal = b2Vec2FromPoint(output.normal);
  boxOutput.fraction = output.fraction;
  
  b2RayCastInput boxInput;
  boxInput.p1 = b2Vec2FromPoint(input.point1);
  boxInput.p2 = b2Vec2FromPoint(input.point2);
  boxInput.maxFraction = input.maxFraction;
  
  return self.fixture->RayCast(&boxOutput, boxInput, (int32)childIndex);
}

- (B2DMassData)massData
{
  b2MassData massData;
  self.fixture->GetMassData(&massData);
  
  return B2DMassDataMake(massData.mass, CGPointFromVector(massData.center), massData.I);
}

- (B2DAABB)aabb:(NSInteger)childIndex
{
  b2AABB aabb = self.fixture->GetAABB((int32)childIndex);  
  return B2DAABBMake(CGPointFromVector(aabb.lowerBound), CGPointFromVector(aabb.upperBound));
}

- (void)dump:(NSInteger)bodyIndex
{
  self.fixture->Dump((int32)bodyIndex);
}

@end
