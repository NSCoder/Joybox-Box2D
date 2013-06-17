//
//  B2DWorldTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DWorldTest.h"
#import "B2DWorld.h"
#import "B2DBody.h"
#import "B2DContactListener.h"
#import "B2DContactFilter.h"
#import "B2DDestructionListener.h"
#import "B2DPolygonShape.h"
#import "B2DFixture.h"
#import "B2DQueryCallback.h"
#import "B2DRayCastCallback.h"

@implementation B2DWorldTest

- (void)testInit
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(CGPointEqualToPoint(world.gravity, CGPointMake(0, 0)), nil);
}

- (void)testInitWithWorld
{
  b2World *boxWorld = new b2World(b2Vec2(0, -10));
  B2DWorld *world = [[B2DWorld alloc] initWithWorld:boxWorld];
  STAssertTrue(CGPointEqualToPoint(world.gravity, CGPointMake(0, -10)), nil);
}

- (void)testDealloc
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertNoThrow([world release], nil);
}


#pragma mark - Properties

- (void)testBodyList
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(1, 1);
  [world createBody:bodyDefinition];
  
  STAssertTrue([world.bodyList count] > 0, nil);
  STAssertTrue([[world.bodyList objectAtIndex:0] isKindOfClass:[B2DBody class]], nil);
}

- (void)testAllowsSleeping
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.allowsSleeping, nil);
}

- (void)testSetAllowsSleeping
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.allowsSleeping = NO;
  STAssertFalse(world.allowsSleeping, nil);
}

- (void)testProxyCount
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.proxyCount == 0, nil);
}

- (void)testBodyCount
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(1, 1);
  [world createBody:bodyDefinition];
  
  STAssertTrue(world.bodyCount == 1, nil);
}

- (void)testJointCount
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.jointCount == 0, nil);
}

- (void)testContactCount
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.contactCount == 0, nil);
}

- (void)testTreeHeight
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.treeHeight == 0, nil);
}

- (void)testTreeBalance
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.treeBalance == 0, nil);
}

- (void)testTreeQuality
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.treeQuality == 0, nil);
}

- (void)testGravity
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(CGPointEqualToPoint(world.gravity, CGPointMake(0, 0)), nil);
}

- (void)testSetGravity
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.gravity = CGPointMake(0, -10);
  STAssertTrue(CGPointEqualToPoint(world.gravity, CGPointMake(0, -10)), nil);
}

- (void)testIsLocked
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertFalse(world.isLocked, nil);
}

- (void)testAutoClearForces
{
  B2DWorld *world = [[B2DWorld alloc] init];
  STAssertTrue(world.autoClearForces, nil);
}

- (void)testSetAutoClearForces
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.autoClearForces = NO;
  STAssertFalse(world.autoClearForces, nil);
}

- (void)testProfile
{
  B2DWorld *world = [[B2DWorld alloc] init];
  B2DProfile profile = world.profile;
  
  STAssertEquals(profile.step, (CGFloat)0.0f, nil);
  STAssertEquals(profile.collide, (CGFloat)0.0f, nil);
  STAssertEquals(profile.solve, (CGFloat)0.0f, nil);
  STAssertEquals(profile.solveInit, (CGFloat)0.0f, nil);
  STAssertEquals(profile.solveVelocity, (CGFloat)0.0f, nil);
  STAssertEquals(profile.solvePosition, (CGFloat)0.0f, nil);
  STAssertEquals(profile.broadphase, (CGFloat)0.0f, nil);
  STAssertEquals(profile.solveTOI, (CGFloat)0.0f, nil);
}

#pragma mark - Methods

- (void)testSetContactListener
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.gravity = CGPointMake(0, -9.8);
  
  B2DContactListener *contactListener = [[B2DContactListener alloc] init];
  contactListener.beginContact = ^(B2DBody *firstBody, B2DBody *secondBody, BOOL isTouching)
  {
    STAssertTrue(firstBody != nil, nil);
    STAssertTrue(secondBody != nil, nil);
    STAssertTrue(isTouching, nil);
  };
  
  [world setContactListener:contactListener];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];

  B2DBody *firstBody = [world createBody:bodyDefinition];
  [firstBody createFixture:fixtureDefinition];
  
  B2DBody *secondBody = [world createBody:bodyDefinition];
  [secondBody createFixture:fixtureDefinition];
  
  [world stepWithDelta:1 velocityInteractions:1 positionInteractions:8];
}

- (void)testSetContactFilter
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.gravity = CGPointMake(0, -9.8);
  
  B2DContactFilter *contactFilter = [[B2DContactFilter alloc] init];
  contactFilter.shouldCollide = ^(B2DFixture *fixtureA, B2DFixture *fixtureB)
  {
    STAssertNotNil(fixtureA.body, nil);
    STAssertNotNil(fixtureB.body, nil);
    STAssertTrue(fixtureA.type == kPolygonShapeType, nil);
    STAssertTrue(fixtureB.type == kPolygonShapeType, nil);
    return YES;
  };
  
  [world setContactFilter:contactFilter];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *firstBody = [world createBody:bodyDefinition];
  [firstBody createFixture:fixtureDefinition];
  
  B2DBody *secondBody = [world createBody:bodyDefinition];
  [secondBody createFixture:fixtureDefinition];
  
  [world stepWithDelta:1 velocityInteractions:1 positionInteractions:8];
}

- (void)testSetDestructionListener
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.gravity = CGPointMake(0, -9.8);
  
  B2DDestructionListener *destructionListener = [[B2DDestructionListener alloc] init];
  destructionListener.fixtureSayGoodbye = ^(B2DFixture *fixture)
  {
    STAssertNotNil(fixture.body, nil);
    STAssertTrue(fixture.type == kPolygonShapeType, nil);
  };
  
  [world setDestructionListener:destructionListener];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *body = [world createBody:bodyDefinition];
  [body createFixture:fixtureDefinition];
  
  [body release];
}

- (void)testCreateBody
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  bodyDefinition.angle = 10;
  bodyDefinition.linearVelocity = CGPointMake(1, 1);
  bodyDefinition.angularVelocity = 4;
  bodyDefinition.linearDamping = 2;
  bodyDefinition.angularDamping = 1;
  bodyDefinition.allowSleep = NO;
  bodyDefinition.awake = NO;
  bodyDefinition.fixedRotation = YES;
  bodyDefinition.bullet = NO;
  bodyDefinition.active = NO;
  bodyDefinition.gravityScale = 2;
  
  B2DBody *body = [world createBody:bodyDefinition];
  
  STAssertTrue(CGPointEqualToPoint(body.position, CGPointMake(10, 10)), nil);
  STAssertEquals(body.type, kDynamicBodyType, nil);
  STAssertEquals(body.angle, (CGFloat)10, nil);
  STAssertTrue(CGPointEqualToPoint(body.linearVelocity, CGPointMake(1, 1)), nil);
  STAssertEquals(body.angularVelocity, (CGFloat)4, nil);
  STAssertEquals(body.linearDamping, (CGFloat)2, nil);
  STAssertEquals(body.angularDamping, (CGFloat)1, nil);
  STAssertFalse(body.isSleepingAllowed, nil);
  STAssertFalse(body.isAwake, nil);
  STAssertTrue(body.fixedRotation, nil);
  STAssertFalse(body.isBullet, nil);
  STAssertFalse(body.isActive, nil);
  STAssertEquals(body.gravityScale, (CGFloat)2, nil);
}

- (void)testDestroyBody
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(1, 1);
  
  B2DBody *body = [world createBody:bodyDefinition];
  [world destroyBody:body];
  
  STAssertTrue([world.bodyList count] == 0, nil);
}

- (void)testStepWithDeltaVelocityInteractionsPositionInteractions
{
  B2DWorld *world = [[B2DWorld alloc] init];
  world.gravity = CGPointMake(0, -9.8);
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *body = [world createBody:bodyDefinition];
  [body createFixture:fixtureDefinition];
  [world stepWithDelta:1 velocityInteractions:1 positionInteractions:8];
  
  STAssertTrue(CGPointEqualToPoint(body.position, CGPointMake(10, 8)), nil);
}

- (void)testClearForces
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *body = [world createBody:bodyDefinition];
  [body createFixture:fixtureDefinition];
  
  [body applyForceToCenter:CGPointMake(10, 0)];
  [world clearForces];
  [world stepWithDelta:1 velocityInteractions:1 positionInteractions:8];
  
  STAssertTrue(CGPointEqualToPoint(body.position, CGPointMake(10, 10)), nil);
}

- (void)testQueryAABBWithCallbackAndAABB
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *body = [world createBody:bodyDefinition];
  [body createFixture:fixtureDefinition];
  
  B2DQueryCallback *queryCallback = [[B2DQueryCallback alloc] init];
  queryCallback.reportFixture = ^(B2DFixture *fixture)
  {
    STAssertNotNil(fixture.body, nil);
    STAssertTrue(fixture.type == kPolygonShapeType, nil);
    return YES;
  };
  
  B2DAABB aabb = B2DAABB();
  aabb.lowerBound = CGPointMake(0, 0);
  aabb.upperBound = CGPointMake(10, 10);
  
  [world queryAABBWithCallback:queryCallback andAABB:aabb];
}

- (void)testRayCastWithCallbackAndPoint1AndPoint2
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  B2DBodyDef bodyDefinition = B2DBodyDef();
  bodyDefinition.position = CGPointMake(10, 10);
  bodyDefinition.type = kDynamicBodyType;
  
  B2DFixtureDef fixtureDefinition = B2DFixtureDef();
  fixtureDefinition.shape = [[B2DPolygonShape alloc] initWithHalfWidth:0.5 andHalfHeight:0.5];
  
  B2DBody *body = [world createBody:bodyDefinition];
  [body createFixture:fixtureDefinition];
  
  B2DRayCastCallback *rayCastCallback = [[B2DRayCastCallback alloc] init];
  rayCastCallback.reportFixture = ^(B2DFixture *fixture, CGPoint point, CGPoint normal, CGFloat fraction)
  {
    STAssertNotNil(fixture.body, nil);
    STAssertTrue(CGPointEqualToPoint(point, CGPointMake(9.5, 9.5)), nil);
    STAssertTrue(CGPointEqualToPoint(normal, CGPointMake(0, -1)), nil);
    STAssertTrue(fraction == 0.949999988079071, nil);
    
    return 0.0f;
  };
  
  [world rayCastWithCallback:rayCastCallback andPoint1:CGPointMake(0, 0) andPoint2:CGPointMake(10, 10)];
}

- (void)testDump
{
  B2DWorld *world = [[B2DWorld alloc] init];
  
  STAssertNoThrow([world dump], nil);
}

@end
