//
//  B2DDraw.m
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import "B2DDraw.h"
#import "B2DColor.h"
#import "B2DTransform.h"

@interface B2DDraw ()

- (void)setupCallbacks;

@end

@implementation B2DDraw

@synthesize draw;
@dynamic drawFlags;
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

#pragma mark - Properties

- (unsigned int)drawFlags
{
  return self.draw->GetFlags();
}

- (void)setDrawFlags:(unsigned int)drawingFlags
{
  self.draw->SetFlags(drawingFlags);
}

#pragma mark - Methods

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
                                
                                B2DColor *color = [[B2DColor alloc] initWithColor:boxColor];

                                weakSelf.drawPolygon(vertices, vertexCount, [color autorelease]);
                                
                                delete[] vertices;
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
                                     
                                     B2DColor *color = [[B2DColor alloc] initWithColor:boxColor];
                                     
                                     weakSelf.drawSolidPolygon(vertices, vertexCount, [color autorelease]);
                                     
                                     delete[] vertices;
                                   }
                                 });
  
  self.draw->SetDrawCircle(^(const b2Vec2 &boxCenter, float32 radius, b2Color boxColor)
                           {
                             if (weakSelf.drawCircle)
                             {
                               CGPoint center = CGPointFromVector(boxCenter);                               
                               
                               B2DColor *color = [[B2DColor alloc] initWithColor:boxColor];
                               
                               weakSelf.drawCircle(center, radius, [color autorelease]);
                             }
                           });
  
  self.draw->SetDrawSolidCircle(^(const b2Vec2 &boxCenter, float32 radius, const b2Vec2& boxAxis, const b2Color &boxColor)
                                {
                                  if (weakSelf.drawSolidCircle)
                                  {
                                    CGPoint center = CGPointFromVector(boxCenter);
                                    CGPoint axis = CGPointFromVector(boxAxis);
                                    
                                    B2DColor *color = [[B2DColor alloc] initWithColor:boxColor];
                                    
                                    weakSelf.drawSolidCircle(center, radius, axis, [color autorelease]);
                                  }
                                });
  
  self.draw->SetDrawSegment(^(const b2Vec2 &boxPoint1, const b2Vec2 &boxPoint2, const b2Color &boxColor)
                            {
                              if (weakSelf.drawSegment)
                              {
                                CGPoint point1 = CGPointFromVector(boxPoint1);
                                CGPoint point2 = CGPointFromVector(boxPoint2);
                                
                                B2DColor *color = [[B2DColor alloc] initWithColor:boxColor];
                              
                                weakSelf.drawSegment(point1, point2, [color autorelease]);
                              }
                            });
  
  self.draw->SetDrawTransform(^(const b2Transform &boxTransform)
                              {
                                if (weakSelf.drawTransform)
                                {
                                  B2DTransform *transform = [[B2DTransform alloc] initWithTransform:boxTransform];
                                  weakSelf.drawTransform([transform autorelease]);
                                }
                              });
}

- (void)appendDrawFlags:(unsigned int)flags
{
  self.draw->AppendFlags(flags);
}

- (void)clearDrawFlags:(unsigned int)flags
{
  self.draw->ClearFlags(flags);
}

@end
