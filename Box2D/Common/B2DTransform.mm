//
//  B2DTransform.m
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DTransform.h"

B2DTransform B2DTransformMake(CGPoint position, CGFloat angle)
{
  B2DTransform transform;
  transform.position = position;
  transform.angle = angle;
  
  return transform;
}