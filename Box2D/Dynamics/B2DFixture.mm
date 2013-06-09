//
//  B2DFixture.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFixture.h"

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

@end
