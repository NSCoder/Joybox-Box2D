//
//  B2DAABB.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DAABB.h"

B2DAABB B2DAABBMake(CGPoint lowerBound, CGPoint upperBound)
{
  B2DAABB aabb;
  aabb.lowerBound = lowerBound;
  aabb.upperBound = upperBound;
  
  return aabb;
}
