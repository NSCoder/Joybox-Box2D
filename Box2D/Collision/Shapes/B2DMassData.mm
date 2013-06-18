//
//  B2DMassData.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DMassData.h"

B2DMassData B2DMassDataMake(CGFloat mass, CGPoint center, CGFloat rotationalInertia)
{
  B2DMassData massData;
  massData.mass = mass;
  massData.center = center;
  massData.rotationalInertia = rotationalInertia;
  
  return massData;
}