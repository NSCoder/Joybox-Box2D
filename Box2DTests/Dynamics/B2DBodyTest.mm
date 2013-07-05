//
//  B2DBodyTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/16/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DBodyTest.h"
#import "B2DBody.h"
#import "B2DWorld.h"
#import "B2DBodyDef.h"
#import "B2DTransform.h"
#import "B2DMassData.h"
#import "B2DFixtureDef.h"
#import "B2DShape.h"
#import "B2DFixture.h"
#import "B2DEdgeShape.h"
#import "B2DPolygonShape.h"

@interface B2DBodyTest ()

@property (nonatomic, retain) B2DWorld *world;

@end

@implementation B2DBodyTest

@synthesize world;

- (void)setUp
{
  self.world = [[B2DWorld alloc] init];
  [super setUp];
}

- (void)tearDown
{
  [self.world release];
  [super tearDown];
}

- (void)testInit
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.body != NULL, nil);
}

- (void)testDealloc
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [[self.world createBody:bodyDefinition] retain];
  
  STAssertNoThrow([body release], nil);
}


#pragma mark - Properties

- (void)testType
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.type == kDynamicBodyType, nil);
}

- (void)testSetType
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.type = kDynamicBodyType;
  
  STAssertTrue(body.type == kDynamicBodyType, nil);
}

- (void)testTransform
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(1, 1);
  bodyDefinition.angle = 1;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.transform.point, CGPointMake(1, 1)), nil);
  STAssertEquals(body.transform.angle, (Float32)1, nil);
}

- (void)testPosition
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(1, 1);
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.position, CGPointMake(1, 1)), nil);
}

- (void)testAngle
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.angle = 1;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.angle, (CGFloat)1, nil);
}

- (void)testWorldCenter
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(2, 2);
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.worldCenter, CGPointMake(2, 2)), nil);
}

- (void)testLocalCenter
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(2, 2);
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.localCenter, CGPointMake(0, 0)), nil);
}

- (void)testLinearVelocity
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.linearVelocity = CGPointMake(1, 1);
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.linearVelocity, CGPointMake(1, 1)), nil);
}

- (void)testSetLinearVelocity
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.linearVelocity = CGPointMake(2, 2);
  
  STAssertTrue(CGPointEqualToPoint(body.linearVelocity, CGPointMake(2, 2)), nil);
}

- (void)testAngularVelocity
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.angularVelocity = 2;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.angularVelocity, (CGFloat)2, nil);
}

- (void)testSetAngularVelocity
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.angularVelocity = 2;
  
  STAssertEquals(body.angularVelocity, (CGFloat)2, nil);
}

- (void)testMass
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.mass, (CGFloat)0, nil);
}

- (void)testInertia
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.inertia, (CGFloat)0, nil);
}

- (void)testMassData
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.massData.mass, (Float32)0, nil);
  STAssertTrue(CGPointEqualToPoint(body.massData.centre, CGPointMake(0, 0)), nil);
  STAssertEquals(body.massData.I, (Float32)0, nil);
}

- (void)testSetMassData
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DMassData *massData = [[B2DMassData alloc] init];
  massData.mass = 2;
  massData.centre = CGPointMake(0, 0);
  massData.I = 1;
  body.massData = massData;
  
  STAssertEquals(body.massData.mass, (Float32)2, nil);
  STAssertTrue(CGPointEqualToPoint(body.massData.centre, CGPointMake(0, 0)), nil);
  STAssertEquals(body.massData.I, (Float32)1, nil);
}

- (void)testLinearDamping
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.linearDamping = 2;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.linearDamping, (CGFloat)2, nil);
}

- (void)testSetLinearDamping
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.linearDamping = 2;
  
  STAssertEquals(body.linearDamping, (CGFloat)2, nil);
}

- (void)testAngularDamping
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.angularDamping = 2;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.angularDamping, (CGFloat)2, nil);
}

- (void)testSetAngularDamping
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.angularDamping = 2;
  
  STAssertEquals(body.angularDamping, (CGFloat)2, nil);
}

- (void)testGravityScale
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.gravityScale = 2;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertEquals(body.gravityScale, (CGFloat)2, nil);
}

- (void)testSetGravityScale
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.gravityScale = 2;
  
  STAssertEquals(body.gravityScale, (CGFloat)2, nil);
}

- (void)testIsBullet
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.bullet = YES;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.isBullet, nil);
}

- (void)testBullet
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.bullet = YES;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.bullet, nil);
}

- (void)testSetBullet
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.bullet = YES;
  
  STAssertTrue(body.isBullet, nil);
}

- (void)testIsAwake
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.awake = NO;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertFalse(body.isAwake, nil);
}

- (void)testAwake
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.awake = NO;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertFalse(body.awake, nil);
}

- (void)testSetAwake
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.awake = NO;
  
  STAssertFalse(body.isAwake, nil);
}

- (void)testIsFixedRotation
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.fixedRotation = YES;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.isFixedRotation, nil);
}

- (void)testFixedRotation
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.fixedRotation = YES;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertTrue(body.fixedRotation, nil);
}

- (void)testSetFixedRotation
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.fixedRotation = YES;
  
  STAssertTrue(body.isFixedRotation, nil);
}

- (void)testIsSleepingAllowed
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.allowSleep = NO;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertFalse(body.isSleepingAllowed, nil);
}

- (void)testSleepingAllowed
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.allowSleep = NO;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertFalse(body.sleepingAllowed, nil);
}

- (void)testSetSleepingAllowed
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  body.sleepingAllowed = NO;
  
  STAssertFalse(body.isSleepingAllowed, nil);
}


#pragma mark - Methods

- (void)testIsEqualToBody
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *firstBody = [self.world createBody:bodyDefinition];
  B2DBody *secondBody = [[B2DBody alloc] initWithBody:firstBody.body];

  STAssertTrue([firstBody isEqualToBody:secondBody], nil);
}


- (void)testResetMassData
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DMassData *massData = [[B2DMassData alloc] init];
  massData.mass = 2;
  massData.centre = CGPointMake(0, 0);
  massData.I = 1;
  body.massData = massData;
  
  [body resetMassData];
  
  STAssertEquals(body.massData.mass, (Float32)0, nil);
  STAssertTrue(CGPointEqualToPoint(body.massData.centre, CGPointMake(0, 0)), nil);
  STAssertEquals(body.massData.I, (Float32)0, nil);
}

- (void)testSetTransformWithPositionAndAngle
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  [body setTransformWithPosition:CGPointMake(1, 1) andAngle:1];
  
  STAssertTrue(CGPointEqualToPoint(body.position, CGPointMake(1, 1)), nil);
  STAssertEquals(body.angle, (CGFloat)1, nil);
}

- (void)testWorldPoint
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(5, 5);
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint worldPoint = [body worldPoint:CGPointMake(1, 1)];
  
  STAssertTrue(CGPointEqualToPoint(worldPoint, CGPointMake(6, 6)), nil);
}

- (void)testWorldVector
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(5, 5);
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint worldVector = [body worldVector:CGPointMake(1, 1)];
  
  STAssertTrue(CGPointEqualToPoint(worldVector, CGPointMake(1, 1)), nil);
}

- (void)testLocalPoint
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(5, 5);
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint localPoint = [body localPoint:CGPointMake(5, 5)];
  
  STAssertTrue(CGPointEqualToPoint(localPoint, CGPointMake(0, 0)), nil);
}

- (void)testLocalVector
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.position = CGPointMake(5, 5);
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint localVector = [body localVector:CGPointMake(5, 5)];
  
  STAssertTrue(CGPointEqualToPoint(localVector, CGPointMake(5, 5)), nil);
}

- (void)testLinearVelocityFromWorldPoint
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(5, 5);
  bodyDefinition.linearVelocity = CGPointMake(1, 1);
  
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint linearVelocity = [body linearVelocityFromWorldPoint:CGPointMake(5, 5)];
  
  STAssertTrue(CGPointEqualToPoint(linearVelocity, CGPointMake(1, 1)), nil);
}

- (void)testLinearVelocityFromLocalPoint
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(5, 5);
  bodyDefinition.linearVelocity = CGPointMake(1, 1);
  
  B2DBody *body = [self.world createBody:bodyDefinition];
  CGPoint linearVelocity = [body linearVelocityFromLocalPoint:CGPointMake(0, 0)];
  
  STAssertTrue(CGPointEqualToPoint(linearVelocity, CGPointMake(1, 1)), nil);
}

- (void)testFixtureList
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  fixtureDefinition.shape = [[B2DEdgeShape alloc] initWithStartVertex:CGPointMake(0, 0) endVertex:CGPointMake(1, 1)];
  [body createFixture:fixtureDefinition];
  
  STAssertEquals([body.fixtureList count], (NSUInteger)1, nil);
  STAssertEquals([[body.fixtureList objectAtIndex:0] class], [B2DFixture class], nil);
}

- (void)testNext
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *firstBody = [self.world createBody:bodyDefinition];
  B2DBody *secondBody = [self.world createBody:bodyDefinition];
  
  STAssertNil([firstBody next], nil);
  STAssertEquals([secondBody next].body, firstBody.body, nil);
}

- (void)testApplyForceAtPoint
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(5, 5);
  
  B2DBody *body = [self.world createBody:bodyDefinition];
  [body applyForce:CGPointMake(1, 1) atPoint:CGPointMake(0, 0)];
  [self.world stepWithDelta:8 velocityInteractions:8 positionInteractions:8];
  
  STAssertFalse(CGPointEqualToPoint(body.position, CGPointMake(5, 5)), nil);
  STAssertFalse(CGPointEqualToPoint(body.linearVelocity, CGPointMake(0, 0)), nil);
}

- (void)testApplyForceToCenter
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(5, 5);
  
  B2DBody *body = [self.world createBody:bodyDefinition];
  [body applyForceToCenter:CGPointMake(1, 1)];
  [self.world stepWithDelta:8 velocityInteractions:8 positionInteractions:8];
  
  STAssertFalse(CGPointEqualToPoint(body.position, CGPointMake(5, 5)), nil);
  STAssertFalse(CGPointEqualToPoint(body.linearVelocity, CGPointMake(0, 0)), nil);
}

- (void)testApplyTorque
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  fixtureDefinition.density = 1;
  [body createFixture:fixtureDefinition];
  
  [body applyTorque:0.5];
  [self.world stepWithDelta:8 velocityInteractions:8 positionInteractions:8];
  
  STAssertTrue(body.angle != 0, nil);
  STAssertTrue(body.angularVelocity != 0, nil);
}

- (void)testApplyLinearImpulse
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.position = CGPointMake(5, 5);
  
  B2DBody *body = [self.world createBody:bodyDefinition];
  [body applyLinearImpulse:CGPointMake(1, 1) atPoint:CGPointMake(0, 0)];
  [self.world stepWithDelta:8 velocityInteractions:8 positionInteractions:8];
  
  STAssertFalse(CGPointEqualToPoint(body.position, CGPointMake(5, 5)), nil);
  STAssertFalse(CGPointEqualToPoint(body.linearVelocity, CGPointMake(0, 0)), nil);
}

- (void)testApplyAngularImpulse
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  bodyDefinition.type = kDynamicBodyType;
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  fixtureDefinition.density = 1;
  [body createFixture:fixtureDefinition];
  
  [body applyAngularImpulse:0.5];
  [self.world stepWithDelta:8 velocityInteractions:8 positionInteractions:8];
  
  STAssertTrue(body.angle != 0, nil);
  STAssertTrue(body.angularVelocity != 0, nil);
}

- (void)testCreateFixture
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DFixtureDef *fixtureDefinition = [[B2DFixtureDef alloc] init];
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  fixtureDefinition.friction = 1;
  fixtureDefinition.restitution = 1;
  fixtureDefinition.density = 1;
  fixtureDefinition.isSensor = YES;
  
  [body createFixture:fixtureDefinition];
  
  STAssertEquals([body.fixtureList count], (NSUInteger)1, nil);
  
  B2DFixture *fixture = [body.fixtureList objectAtIndex:0];
  STAssertEquals(fixture.type, kPolygonShapeType, nil);
  STAssertEquals(fixture.friction, (CGFloat)1, nil);
  STAssertEquals(fixture.restitution, (CGFloat)1, nil);
  STAssertEquals(fixture.density, (CGFloat)1, nil);
  STAssertTrue(fixture.isSensor, nil);
}

- (void)testCreateFixtureWithShapeAndDensity
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  [body createFixtureWithShape:shape andDensity:1];
  
  STAssertEquals([body.fixtureList count], (NSUInteger)1, nil);
  
  B2DFixture *fixture = [body.fixtureList objectAtIndex:0];
  STAssertEquals(fixture.type, kPolygonShapeType, nil);
  STAssertEquals(fixture.density, (CGFloat)1, nil);
}

- (void)destroyFixture
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  B2DShape *shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  [body createFixtureWithShape:shape andDensity:1];
  
  STAssertEquals([body.fixtureList count], (NSUInteger)1, nil);
  
  B2DFixture *fixture = [body.fixtureList objectAtIndex:0];
  [body destroyFixture:fixture];
  
  STAssertEquals([body.fixtureList count], (NSUInteger)0, nil);
}

- (void)testDump
{
  B2DBodyDef *bodyDefinition = [[B2DBodyDef alloc] init];
  B2DBody *body = [self.world createBody:bodyDefinition];
  
  STAssertNoThrow([body dump], nil);
}

@end
