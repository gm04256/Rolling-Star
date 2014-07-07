//
//  BGMMyScene.m
//  Rolling Star
//
//  Created by 馬 岩 on 14-7-4.
//  Copyright (c) 2014年 馬 岩. All rights reserved.
//

#import "BGMMyScene.h"
#import "BGMStarNode.h"
#import "BGMBallNode.h"

#define ARC4RANDOM_MAX      0x100000000

@interface BGMMyScene()

@property SKNode* myStar;
@property SKNode* myBalls;

@end

@implementation BGMMyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
	{
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];
        
		// add star node
		self.myStar = [SKNode node];
		
		BGMStarNode* star1 = [[BGMStarNode alloc] init];
		star1.position = CGPointMake(self.frame.size.width / 4, self.frame.size.height / 4);
		star1.physicsBody.angularVelocity = -5;
		[self.myStar addChild:star1];
		
		BGMStarNode* star2 = [[BGMStarNode alloc] init];
		star2.position = CGPointMake(self.frame.size.width * 3.0 / 4, self.frame.size.height / 2);
		star2.physicsBody.angularVelocity = 5;
		[self.myStar addChild:star2];
		
		BGMStarNode* star3 = [[BGMStarNode alloc] init];
		star3.position = CGPointMake(self.frame.size.width / 4, self.frame.size.height * 3.0 / 4);
		star3.physicsBody.angularVelocity = -5;
		[self.myStar addChild:star3];
				
		[self addChild:self.myStar];
		
		// add ball node
		self.myBalls = [SKNode node];
		for (int i = 0; i < 10; i++)
		{
			BGMBallNode* myBall = [[BGMBallNode alloc] init];
			
			myBall.position = CGPointMake(self.frame.size.width * arc4random() / ARC4RANDOM_MAX, self.frame.size.height);
			myBall.physicsBody.affectedByGravity = YES;
			
			[self.myBalls addChild:myBall];
		}
		[self addChild:self.myBalls];
	}
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
	{
        CGPoint location = [touch locationInNode:self];
        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
	
	for (BGMBallNode* myBall in [self.myBalls children])
	{
		if (!CGRectContainsPoint(self.frame, myBall.position))
		{
			myBall.position = CGPointMake(self.frame.size.width * arc4random() / ARC4RANDOM_MAX, self.frame.size.height);
			myBall.physicsBody.velocity = CGVectorMake(0, 0);
		}
	}
}

@end
