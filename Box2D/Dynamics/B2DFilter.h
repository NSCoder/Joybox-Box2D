//
//  B2DFilter.h
//  Box2D
//
//  Created by Juan José Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DFilter_h
#define Box2D_B2DFilter_h

struct B2DFilter
{
  B2DFilter()
  {
    categoryBits = 0x0001;
		maskBits = 0xFFFF;
		groupIndex = 0;
  }
  
  uint16 categoryBits;
  uint16 maskBits;
  int16 groupIndex;
};
typedef struct B2DFilter B2DFilter;

B2DFilter B2DFilterMake(uint16 categoryBits, uint16 maskBits, int16 groupIndex);

#endif