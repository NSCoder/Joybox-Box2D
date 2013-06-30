//
//  B2DDraw.m
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DDraw.h"

@interface B2DDraw ()

- (void)setupCallbacks;

@end

@implementation B2DDraw

@synthesize draw;
@synthesize drawPolygon;
@synthesize drawSolidPolygon;
@synthesize drawCircle;
@synthesize drawSolidCircle;
@synthesize drawSegment;
@synthesize drawTransform;

- (id)init
{
  self = [super init];
  
  if (self)
  {
    self.draw = new Draw();
    
    [self setupCallbacks];
  }
  
  return self;
}

- (void)dealloc
{
  [drawPolygon release];
  drawPolygon = nil;
  
  [drawSolidPolygon release];
  drawSolidPolygon = nil;
  
  [drawCircle release];
  drawCircle = nil;
  
  [drawSolidCircle release];
  drawSolidCircle = nil;
  
  [drawSegment release];
  drawSegment = nil;
  
  [drawTransform release];
  drawTransform = nil;
  
  delete draw;
  draw = nil;
  
  [super dealloc];
}

- (void)setupCallbacks
{
  __block B2DDraw *weakSelf = self;
  
  self.draw->SetDrawPolygon(^(const b2Vec2 *boxVertices, int32 vertexCount, const b2Color &boxColor)
                            {
                              if (weakSelf.drawPolygon != nil)
                              {
                                CGPoint *vertices = new CGPoint[vertexCount];
                                
                                for(int i = 0; i < vertexCount; i ++)
                                {
                                  vertices[i] = CGPointFromVector(boxVertices[i]);
                                }
                                
                                B2DColor color = B2DColorMake(boxColor.r, boxColor.g, boxColor.b);
                                
                                weakSelf.drawPolygon(vertices, vertexCount, color);
                              }
                            });
  
  
  self.draw->SetDrawSolidPolygon(^(const b2Vec2 *boxVertices, int32 vertexCount, const b2Color &boxColor)
                                 {
                                   if (weakSelf.drawSolidPolygon != nil)
                                   {
                                     CGPoint *vertices = new CGPoint[vertexCount];
                                     
                                     for(int i = 0; i < vertexCount; i ++)
                                     {
                                       vertices[i] = CGPointFromVector(boxVertices[i]);
                                     }
                                     
                                     B2DColor color = B2DColorMake(boxColor.r, boxColor.g, boxColor.b);
                                     
                                     weakSelf.drawSolidPolygon(vertices, vertexCount, color);
                                   }
                                 });
  
  self.draw->SetDrawCircle(^(const b2Vec2 &boxCenter, float32 radius, const b2Color &boxColor)
                           {
                             if (weakSelf.drawCircle)
                             {
                               CGPoint center = CGPointFromVector(boxCenter);
                               B2DColor color = B2DColorMake(boxColor.r, boxColor.g, boxColor.b);
                             
                               weakSelf.drawCircle(center, radius, color);
                             }
                           });
  
  self.draw->SetDrawSolidCircle(^(const b2Vec2 &boxCenter, float32 radius, const b2Color &boxColor)
                                {
                                  if (weakSelf.drawSolidCircle)
                                  {
                                    CGPoint center = CGPointFromVector(boxCenter);
                                    B2DColor color = B2DColorMake(boxColor.r, boxColor.g, boxColor.b);
                                  
                                    weakSelf.drawSolidCircle(center, radius, color);
                                  }
                                });
  
  self.draw->SetDrawSegment(^(const b2Vec2 &boxPoint1, const b2Vec2 &boxPoint2, const b2Color &boxColor)
                            {
                              if (weakSelf.drawSegment)
                              {
                                CGPoint point1 = CGPointFromVector(boxPoint1);
                                CGPoint point2 = CGPointFromVector(boxPoint2);
                                B2DColor color = B2DColorMake(boxColor.r, boxColor.g, boxColor.b);
                              
                                weakSelf.drawSegment(point1, point2, color);
                              }
                            });
  
  self.draw->SetDrawTransform(^(const b2Transform &boxTransform)
                              {
                                if (weakSelf.drawTransform)
                                {
                                  B2DTransform transform = B2DTransformMake(CGPointFromVector(boxTransform.p),
                                                                            boxTransform.q.GetAngle());
                                
                                  weakSelf.drawTransform(transform);
                                }
                              });
}

@end
