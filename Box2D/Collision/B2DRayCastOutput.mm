//
//  B2DRayCastOutput.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DRayCastOutput.h"

B2DRayCastOutput B2DRayCastOutputMake(CGPoint normal, CGFloat fraction)
{
  B2DRayCastOutput rayCastOutput;
  rayCastOutput.normal = normal;
  rayCastOutput.fraction = fraction;
  
  return rayCastOutput;
}
