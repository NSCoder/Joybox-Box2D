//
//  B2DChainShape.h
//  Box2D
//
//  Created by Francisco Granados on 20/04/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "B2DShape.h"

@interface B2DChainShape : B2DShape

- (id)initWithLoop:(CGPoint)aVertices
          andCount:(NSInteger)count;

- (id)initWithChain:(CGPoint)aVertices
           andCount:(NSInteger)count;

@end
