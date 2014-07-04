//
//  BGMStarNode.m
//  Rolling Star
//
//  Created by 馬 岩 on 14-7-4.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMStarNode.h"

@implementation BGMStarNode

- (instancetype)init
{
	if(self = [super init])
	{
		self.name = [NSString stringWithFormat:@"Star %p", self];
		
		[self initGraph];
		[self initBody];
	}
	
	return self;
}

- (void)initGraph
{
	// star node
	SKShapeNode* myNode = [SKShapeNode node];
	
	myNode.strokeColor = [SKColor greenColor];
	myNode.fillColor = [SKColor yellowColor];
	myNode.lineWidth = 5;
	myNode.antialiased = YES;
//	myNode.glowWidth = 3;
	
	// init path
	float outerRadius = 100;
	float innerRadius = outerRadius * 0.4;
	CGMutablePathRef starPath = CGPathCreateMutable();
	
	CGPathMoveToPoint(starPath, &CGAffineTransformIdentity, 0, outerRadius);
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, innerRadius * cos(54.0 / 180 * M_PI), innerRadius * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, outerRadius * cos(18.0 / 180 * M_PI), outerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, innerRadius * cos(18.0 / 180 * M_PI), -innerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, outerRadius * cos(54.0 / 180 * M_PI), -outerRadius * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, 0, -innerRadius);
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -outerRadius * cos(54.0 / 180 * M_PI), -100 * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -innerRadius * cos(18.0 / 180 * M_PI), -innerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -outerRadius * cos(18.0 / 180 * M_PI), outerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -innerRadius * cos(54.0 / 180 * M_PI), innerRadius * sin(54.0 / 180 * M_PI));
//	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, 0, outerRadius);
	CGPathCloseSubpath(starPath);
	
	myNode.path = starPath;
	
	
	[self addChild:myNode];
}

- (void)initBody
{
	// init physics body
	float outerRadius = 100;
	float innerRadius = outerRadius * 0.4;
	CGMutablePathRef starPath = CGPathCreateMutable();
	
	CGPathMoveToPoint(starPath, &CGAffineTransformIdentity, 0, outerRadius);
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, innerRadius * cos(54.0 / 180 * M_PI), innerRadius * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, outerRadius * cos(18.0 / 180 * M_PI), outerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, innerRadius * cos(18.0 / 180 * M_PI), -innerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, outerRadius * cos(54.0 / 180 * M_PI), -outerRadius * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, 0, -innerRadius);
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -outerRadius * cos(54.0 / 180 * M_PI), -100 * sin(54.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -innerRadius * cos(18.0 / 180 * M_PI), -innerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -outerRadius * cos(18.0 / 180 * M_PI), outerRadius * sin(18.0 / 180 * M_PI));
	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, -innerRadius * cos(54.0 / 180 * M_PI), innerRadius * sin(54.0 / 180 * M_PI));
//	CGPathAddLineToPoint(starPath, &CGAffineTransformIdentity, 0, outerRadius);
	CGPathCloseSubpath(starPath);
	
	SKPhysicsBody * starBody = [SKPhysicsBody bodyWithEdgeChainFromPath:starPath];

	self.physicsBody = starBody;
}

@end
