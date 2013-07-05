//
//  B2DDrawCallbackTest.m
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DDrawCallbackTest.h"
#import "B2DDraw.h"


@implementation B2DDrawCallbackTest

- (void)testInit
{
  B2DDraw *draw = [[B2DDraw alloc] init];
  STAssertTrue(draw.draw != NULL, nil);
  STAssertTrue(draw.draw->GetDrawPolygon() != NULL, nil);
  STAssertTrue(draw.draw->GetDrawSolidPolygon() != NULL, nil);
  STAssertTrue(draw.draw->GetDrawCircle() != NULL, nil);
  STAssertTrue(draw.draw->GetDrawSolidCircle() != NULL, nil);
  STAssertTrue(draw.draw->GetDrawSegment() != NULL, nil);
  STAssertTrue(draw.draw->GetDrawTransform() != NULL, nil);
}

- (void)testDealloc
{
  B2DDraw *draw = [[B2DDraw alloc] init];
  STAssertNoThrow([draw release], nil);
}

#pragma mark - Properties

- (void)testDrawingFlags
{
  B2DDraw *draw = [[B2DDraw alloc] init];
  
  unsigned int drawFlags = kShapeDrawFlag;
  drawFlags += kCenterOfMassDrawFlag;
  draw.drawFlags = drawFlags;
  STAssertEquals(draw.drawFlags, drawFlags, nil);
}

- (void)testAppendDrawingFlags
{
  B2DDraw *draw = [[B2DDraw alloc] init];
  unsigned int drawFlags = kShapeDrawFlag;
  draw.drawFlags = drawFlags;
  
  [draw appendDrawFlags:kCenterOfMassDrawFlag];
  drawFlags += kCenterOfMassDrawFlag;
  STAssertEquals(draw.drawFlags, drawFlags, nil);
}

- (void)testClearDrawingFlags
{
  B2DDraw *draw = [[B2DDraw alloc] init];
  unsigned int drawFlags = kShapeDrawFlag;
  drawFlags += kCenterOfMassDrawFlag;
  draw.drawFlags = drawFlags;
  
  [draw clearDrawFlags:kCenterOfMassDrawFlag];
  drawFlags -= kCenterOfMassDrawFlag;
  STAssertEquals(draw.drawFlags, drawFlags, nil);
}

@end
