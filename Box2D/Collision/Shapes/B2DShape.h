//
//  B2DShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShapeTypes.h"
#import "B2DTransform.h"
#import "B2DRayCastOutput.h"
#import "B2DRayCastInput.h"
#import "B2DAABB.h"
#import "B2DMassData.h"

@interface B2DShape : NSObject {
  
  b2Shape *shape;
}

@property (nonatomic, assign) b2Shape *shape;

- (id)initWithShape:(b2Shape *)boxShape;

@end
