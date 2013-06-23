//
//  CBBody.mm
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DBody.h"
#import "B2DFixture.h"
#import "B2DShape.h"
#import "B2DWorld.h"

@implementation B2DBody

@synthesize body;
@synthesize userData;
@dynamic type;
@dynamic position;
@dynamic angle;
@dynamic worldCenter;
@dynamic localCenter;
@dynamic linearVelocity;
@dynamic angularVelocity;
@dynamic mass;
@dynamic inertia;
@dynamic massData;
@dynamic linearDamping;
@dynamic angularDamping;
@dynamic gravityScale;
@dynamic isBullet;
@dynamic bullet;
@dynamic isAwake;
@dynamic awake;
@dynamic isActive;
@dynamic isFixedRotation;
@dynamic fixedRotation;
@dynamic isSleepingAllowed;
@dynamic sleepingAllowed;
@dynamic center;


#pragma mark - Object Lifecycle

- (id)initWithBody:(b2Body *)aBody
{
  self = [super init];
  
  if (self)
  {
    self.body = aBody;
    aBody->SetUserData((void *)self);
  }
  
  return self;
}

- (void)dealloc
{
  [userData release];
  userData = nil;
  
  [super dealloc];
}


#pragma mark - Properties

- (B2DBodyTypes)type
{
  return (B2DBodyTypes)self.body->GetType();
}

- (void)setType:(B2DBodyTypes)type
{
  self.body->SetType((b2BodyType)type);
}

- (B2DTransform)transform
{
  b2Transform transform = self.body->GetTransform();
  return B2DTransformMake(CGPointFromVector(transform.p), transform.q.GetAngle());
}

- (CGPoint)position
{
  b2Vec2 actualPosition = self.body->GetPosition();
  return CGPointMake(actualPosition.x, actualPosition.y);
}

- (CGFloat)angle
{
  return self.body->GetAngle();
}

- (CGPoint)worldCenter
{
  return CGPointFromVector(self.body->GetWorldCenter());
}

- (CGPoint)localCenter
{
  return CGPointFromVector(self.body->GetLocalCenter());
}

- (CGPoint)linearVelocity
{
  return CGPointFromVector(self.body->GetLinearVelocity());
}

- (void)setLinearVelocity:(CGPoint)linearVelocity
{
  self.body->SetLinearVelocity(b2Vec2FromPoint(linearVelocity));
}

- (CGFloat)angularVelocity
{
  return self.body->GetAngularVelocity();
}

- (void)setAngularVelocity:(CGFloat)angularVelocity
{
  self.body->SetAngularVelocity(angularVelocity);
}

- (CGFloat)mass
{
  return self.body->GetMass();
}

- (CGFloat)inertia
{
  return self.body->GetInertia();
}

- (B2DMassData)massData
{
  b2MassData massData;
  self.body->GetMassData(&massData);
  
  return B2DMassDataMake(massData.mass, CGPointFromVector(massData.center), massData.I);
}

- (void)setMassData:(B2DMassData)massData
{
  b2MassData boxMassData = b2MassData();
  boxMassData.mass = massData.mass;
  boxMassData.center = b2Vec2FromPoint(massData.center);
  boxMassData.I = massData.rotationalInertia;
  
  self.body->SetMassData(&boxMassData);
}

- (CGFloat)linearDamping
{
  return self.body->GetLinearDamping();
}

- (void)setLinearDamping:(CGFloat)linearDamping
{
  self.body->SetLinearDamping(linearDamping);
}

- (CGFloat)angularDamping
{
  return self.body->GetAngularDamping();
}

- (void)setAngularDamping:(CGFloat)angularDamping
{
  self.body->SetAngularDamping(angularDamping);
}

- (CGFloat)gravityScale
{
  return self.body->GetGravityScale();
}

- (void)setGravityScale:(CGFloat)gravityScale
{
  self.body->SetGravityScale(gravityScale);
}

- (BOOL)isBullet
{
  return self.body->IsBullet();
}

- (BOOL)bullet
{
  return [self isBullet];
}

- (void)setBullet:(BOOL)bullet
{
  self.body->SetBullet(bullet);
}

- (BOOL)isAwake
{
  return self.body->IsAwake();
}

- (BOOL)awake
{
  return [self isAwake];
}

- (void)setAwake:(BOOL)awake
{
  self.body->SetAwake(awake);
}

- (BOOL)isActive
{
  return self.body->IsActive();
}

- (BOOL)isFixedRotation
{
  return self.body->IsFixedRotation();
}

- (BOOL)fixedRotation
{
  return [self isFixedRotation];
}

- (void)setFixedRotation:(BOOL)fixedRotation
{
  self.body->SetFixedRotation(fixedRotation);
}

- (BOOL)isSleepingAllowed
{
  return self.body->IsSleepingAllowed();
}

- (BOOL)sleepingAllowed
{
  return [self isSleepingAllowed];
}

- (void)setSleepingAllowed:(BOOL)sleepingAllowed
{
  self.body->SetSleepingAllowed(sleepingAllowed);
}

#pragma mark - Methods

- (BOOL)isEqualToBody:(B2DBody *)aBody
{
  BOOL isEqual = NO;
  
  if (self.body == aBody.body)
  {
    isEqual = YES;
  }
  
  return isEqual;
}

- (void)resetMassData
{
  self.body->ResetMassData();
}

- (void)setTransformWithPosition:(CGPoint)position andAngle:(CGFloat)angle
{
  self.body->SetTransform(b2Vec2FromPoint(position), angle);
}

- (CGPoint)worldPoint:(CGPoint)localPoint
{
  b2Vec2 worldPoint = self.body->GetWorldPoint(b2Vec2FromPoint(localPoint));
  return CGPointFromVector(worldPoint);
}

- (CGPoint)worldVector:(CGPoint)localVector
{
  b2Vec2 worldVector = self.body->GetWorldVector(b2Vec2FromPoint(localVector));
  return CGPointFromVector(worldVector);
}

- (CGPoint)localPoint:(CGPoint)worldPoint
{
  b2Vec2 localPoint = self.body->GetLocalPoint(b2Vec2FromPoint(worldPoint));
  return CGPointFromVector(localPoint);
}

- (CGPoint)localVector:(CGPoint)worldVector
{
  b2Vec2 localVector = self.body->GetLocalVector(b2Vec2FromPoint(worldVector));
  return CGPointFromVector(localVector);
}

- (CGPoint)linearVelocityFromWorldPoint:(CGPoint)worldPoint
{
  b2Vec2 linearVelocity = self.body->GetLinearVelocityFromWorldPoint(b2Vec2FromPoint(worldPoint));
  return CGPointFromVector(linearVelocity);
}

- (CGPoint)linearVelocityFromLocalPoint:(CGPoint)localPoint
{
  b2Vec2 linearVelocity = self.body->GetLinearVelocityFromLocalPoint(b2Vec2FromPoint(localPoint));
  return CGPointFromVector(linearVelocity);
}

- (NSArray *)fixtureList
{
  NSMutableArray *fixtureList = [[NSMutableArray alloc] init];
  
  for (b2Fixture *boxFixture = self.body->GetFixtureList(); boxFixture; boxFixture = boxFixture->GetNext())
  {
    B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
    [fixtureList addObject:fixture];
    [fixture release];
  }
  
  return [fixtureList autorelease];
}

- (B2DBody *)next
{
  b2Body *boxBody = self.body->GetNext();
  
  if (boxBody == NULL) { return nil; }
  
  return [[B2DBody alloc] initWithBody:boxBody];
}

- (void)applyForce:(CGPoint)force atPoint:(CGPoint)point
{  
  self.body->ApplyForce(b2Vec2FromPoint(force), b2Vec2FromPoint(point));
}

- (void)applyForceToCenter:(CGPoint)force
{  
  self.body->ApplyForceToCenter(b2Vec2FromPoint(force));
}

- (void)applyTorque:(CGFloat)torque
{
  self.body->ApplyTorque(torque);
}

- (void)applyLinearImpulse:(CGPoint)impulse atPoint:(CGPoint)point
{
  self.body->ApplyLinearImpulse(b2Vec2FromPoint(impulse), b2Vec2FromPoint(point));
}

- (void)applyAngularImpulse:(CGFloat)impulse
{
  self.body->ApplyAngularImpulse(impulse);
}

- (void)createFixture:(B2DFixtureDef)fixtureDefinition
{
  b2FixtureDef fixture;
  
  fixture.shape = fixtureDefinition.shape.shape;
  fixture.friction = fixtureDefinition.friction;
  fixture.restitution = fixtureDefinition.restitution;
  fixture.density = fixtureDefinition.density;
  fixture.isSensor = fixtureDefinition.isSensor;
  
  body->CreateFixture(&fixture);
}

- (void)createFixtureWithShape:(B2DShape *)shape andDensity:(CGFloat)density
{
  body->CreateFixture(shape.shape, density);
}

- (void)destroyFixture:(B2DFixture *)fixture
{
  body->DestroyFixture(fixture.fixture);
}

- (void)dump
{
  body->Dump();
}


#pragma mark - Deprecated

- (void)setPosition:(CGPoint)newPosition
{
  NSLog(@"Deprecated Method: User setTransformWithPosition:andAngle: instead.");
  self.body->SetTransform(b2Vec2(newPosition.x, newPosition.y), self.body->GetAngle());
}

- (CGPoint)center
{
  NSLog(@"Deprecated Method: Use worldCenter instead.");
  b2Vec2 vectorCenter = self.body->GetWorldCenter();
  
  return CGPointMake(vectorCenter.x, vectorCenter.y);
}

- (void)addFixtureForShape:(B2DShape *)shape
                  friction:(CGFloat)friction
               restitution:(CGFloat)restitution
                   density:(CGFloat)density
                  isSensor:(BOOL)isSensor
{
  b2FixtureDef fixtureDefinition;
  
  fixtureDefinition.shape = shape.shape;
  fixtureDefinition.friction = friction;
  fixtureDefinition.restitution = restitution;
  fixtureDefinition.density = density;
  fixtureDefinition.isSensor = isSensor;
  body->CreateFixture(&fixtureDefinition);
}


- (void)applyForce:(CGPoint)force
        atLocation:(CGPoint)location
         asImpulse:(BOOL)impulse
{
  NSLog(@"Deprecated Method: Use applyForce:atPoint: instead.");
  
  b2Vec2 vectorForce;
  vectorForce.Set(force.x, force.y);
  
  b2Vec2 vectorLocation;
  vectorLocation.Set(location.x, location.y);
  
  if (impulse)
  {
    self.body->ApplyLinearImpulse(vectorForce, vectorLocation);
  }
  else
  {
    self.body->ApplyForce(vectorForce, vectorLocation);
  }
}


- (void)applyTorque:(CGFloat)torque
          asImpulse:(BOOL)impulse
{
  NSLog(@"Deprecated Method: Use applyTorque: instead.");
  
  if (impulse)
  {
    self.body->ApplyAngularImpulse(torque);
  }
  else
  {
    self.body->ApplyTorque(torque);
  }
}

@end
