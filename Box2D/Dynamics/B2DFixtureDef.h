//
//  B2DFixtureDef.h
//  Box2D
//
//  Created by Juan José Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DFixtureDef_h
#define Box2D_B2DFixtureDef_h

@class B2DShape;

struct B2DFixtureDef
{
  B2DFixtureDef()
	{
		shape = NULL;
		userData = NULL;
		friction = 0.2f;
		restitution = 0.0f;
		density = 0.0f;
		isSensor = false;
	}
  
  B2DShape *shape;
  id userData;
  CGFloat friction;
  CGFloat restitution;
  CGFloat density;
  BOOL isSensor;
};
typedef struct B2DFixtureDef B2DFixtureDef;

#endif
