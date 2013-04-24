//
//  B2DCircleShape.mm
//  Box2D
//
//  Created by Kenichi Yonekawa on 13/04/24.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DCircleShape.h"

@implementation B2DCircleShape

- (id)initWithRadius:(CGFloat)radius
{
    self = [super init];
    if (self)
    {
        b2CircleShape *circleShape = new b2CircleShape();
        circleShape->m_radius = radius;
        self.shape = circleShape;
    }
    return self;
}

@end
