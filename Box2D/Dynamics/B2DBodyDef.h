//
//  B2DBodyDef.h
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DBodyDef_h
#define Box2D_B2DBodyDef_h

#import "B2DBodyTypes.h"

struct B2DBodyDef
{
  B2DBodyDef()
	{
		position = CGPointMake(0.0f, 0.0f);
		angle = 0.0f;
		linearVelocity = CGPointMake(0.0f, 0.0f);
		angularVelocity = 0.0f;
		linearDamping = 0.0f;
		angularDamping = 0.0f;
		allowSleep = true;
		awake = true;
		fixedRotation = false;
		bullet = false;
		type = kStaticBodyType;
		active = true;
		gravityScale = 1.0f;
	}
  
  B2DBodyTypes type;
  CGPoint position;
  CGFloat angle;
  CGPoint linearVelocity;
  CGFloat angularVelocity;
  CGFloat linearDamping;
  CGFloat angularDamping;
  BOOL allowSleep;
  BOOL awake;
  BOOL fixedRotation;
  BOOL bullet;
  BOOL active;
  CGFloat gravityScale;
};
typedef struct B2DBodyDef B2DBodyDef;


#endif
