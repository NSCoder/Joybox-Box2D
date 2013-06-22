//
//  B2DFixtureTest.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class B2DWorld;
@class B2DBody;

@interface B2DFixtureTest : SenTestCase {
  B2DWorld *world;
  B2DBody *body;
}

@end
