//
//  B2DMacros.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline CGPoint CGPointFromVector(b2Vec2 vector)
{
	return CGPointMake(vector.x, vector.y);
}

static inline b2Vec2 b2Vec2FromPoint(CGPoint point)
{
	return b2Vec2(point.x, point.y);
}