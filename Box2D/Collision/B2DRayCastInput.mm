//
//  B2DRayCastInput.m
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastInput.h"

B2DRayCastInput BB2DRayCastInputMake(CGPoint point1, CGPoint point2, CGFloat maxFraction)
{
  B2DRayCastInput rayCastInput;
  rayCastInput.point1 = point1;
  rayCastInput.point2 = point2;
  rayCastInput.maxFraction = maxFraction;
  
  return rayCastInput;
}