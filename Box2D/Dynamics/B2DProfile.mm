//
//  B2DProfile.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DProfile.h"

B2DProfile B2DProfileMake(CGFloat step,
                          CGFloat collide,
                          CGFloat solve,
                          CGFloat solveInit,
                          CGFloat solveVelocity,
                          CGFloat solvePosition,
                          CGFloat broadphase,
                          CGFloat solveTOI)
{
  B2DProfile profile;
  profile.step = step;
  profile.collide = collide;
  profile.solve = solve;
  profile.solveInit = solveInit;
  profile.solveVelocity = solveVelocity;
  profile.solvePosition = solvePosition;
  profile.broadphase = broadphase;
  profile.solveTOI = solveTOI;

  return profile;
}