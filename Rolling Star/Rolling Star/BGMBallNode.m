//
//  BGMBallNode.m
//  Rolling Star
//
//  Created by 馬 岩 on 14-7-4.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMBallNode.h"

@implementation BGMBallNode

- (instancetype)init
{
	if(self = [super init])
	{
		self.name = [NSString stringWithFormat:@"Ball %p", self];
		
		[self initGraph];
		[self initBody];
	}
	
	return self;
}

- (void)initGraph
{
	SKShapeNode* myNode = [SKShapeNode node];
	
	myNode.strokeColor = [SKColor orangeColor];
	myNode.fillColor = [SKColor blueColor];
	myNode.lineWidth = 2;
	myNode.antialiased = YES;
//	myNode.glowWidth = 3;
	
	CGPathRef myPath = CGPathCreateWithEllipseInRect(CGRectMake(-10, -10, 20, 20), &CGAffineTransformIdentity);
	
	myNode.path = myPath;
	
	[self addChild:myNode];
}

- (void)initBody
{
	SKPhysicsBody* myBody = [SKPhysicsBody bodyWithCircleOfRadius:10];
	
	self.physicsBody = myBody;
}

@end
