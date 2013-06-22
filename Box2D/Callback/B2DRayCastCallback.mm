//
//  B2DRayCastCallback.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastCallback.h"
#import "B2DFixture.h"

@interface B2DRayCastCallback ()

- (void)setupCallbacks;

@end

@implementation B2DRayCastCallback

@synthesize rayCastCallback;
@synthesize reportFixture;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.rayCastCallback = new RayCastCallback();
    [self setupCallbacks];
  }
  
  return self;
}

- (void)dealloc
{
  [reportFixture release];
  reportFixture = nil;
  
  delete rayCastCallback;
  rayCastCallback = nil;
  
  [super dealloc];
}

- (void)setupCallbacks
{
  __block B2DRayCastCallback *weakSelf = self;
  self.rayCastCallback->SetReportFixture(^(b2Fixture *boxFixture, const b2Vec2& boxPoint, const b2Vec2& boxNormal, float32 fraction)
                                         {
                                           if (weakSelf.reportFixture != nil)
                                           {
                                             B2DFixture *fixture = [[B2DFixture alloc] initWithFixture:boxFixture];
                                             CGPoint point = CGPointFromVector(boxPoint);
                                             CGPoint normal = CGPointFromVector(boxNormal);
                                             return weakSelf.reportFixture([fixture autorelease], point, normal, fraction);
                                           }
                                           else
                                           {
                                             return 0.0f;
                                           }
                                         });
}

@end
