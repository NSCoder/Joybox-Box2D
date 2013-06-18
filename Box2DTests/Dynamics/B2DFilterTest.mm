//
//  B2DFilterTest.mm
//  Box2D
//
//  Created by Juan Jose Karam on 6/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DFilterTest.h"
#import "B2DFilter.h"

@implementation B2DFilterTest

- (void)testB2DFilterMake
{
  B2DFilter firstFilter = B2DFilterMake();
  STAssertEquals(firstFilter.categoryBits, (uint16)0x0001, nil);
  STAssertEquals(firstFilter.maskBits, (uint16)0xFFFF, nil);
  STAssertEquals(firstFilter.groupIndex, (int16)0, nil);
  
  B2DFilter secondFilter = B2DFilterMake(0x0002, 0xFF0F, 1);
  STAssertEquals(secondFilter.categoryBits, (uint16)0x0002, nil);
  STAssertEquals(secondFilter.maskBits, (uint16)0xFF0F, nil);
  STAssertEquals(secondFilter.groupIndex, (int16)1, nil);
}

@end
