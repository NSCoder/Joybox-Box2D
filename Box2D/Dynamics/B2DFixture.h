//
//  B2DFixture.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B2DShape;

@interface B2DFixture : NSObject {
  
  b2Fixture *fixture;
}

@property (nonatomic, assign) b2Fixture *fixture;

- (id)initWithFixture:(b2Fixture *)boxFixture;

@end
