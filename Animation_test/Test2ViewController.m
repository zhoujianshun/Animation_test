//
//  Test2ViewController.m
//  Animation_test
//
//  Created by 周建顺 on 15/7/1.
//  Copyright (c) 2015年 周建顺. All rights reserved.
//

#import "Test2ViewController.h"

#define LAYER_WIDTH 100.f
#define LAYER_HEIGHT 100.f

@interface Test2ViewController()

@property (nonatomic,strong) CALayer *myLayer;

@end

@implementation Test2ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self addLayer];
    
}

-(void)addLayer{

    self.myLayer = [[CALayer alloc] init];
    self.myLayer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    self.myLayer.bounds = CGRectMake(0, 0, LAYER_WIDTH, LAYER_HEIGHT);
    self.myLayer.position = self.view.center;
    self.myLayer.cornerRadius = LAYER_WIDTH/2;
    // 阴影；
    
    self.myLayer.shadowColor = [UIColor grayColor].CGColor;
    self.myLayer.shadowOffset = CGSizeMake(2, 2);
    self.myLayer.shadowOpacity = 0.8;
    
    
    [self.view.layer addSublayer:self.myLayer];
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =  [touches anyObject];
    
    CGFloat width = self.myLayer.bounds.size.width;
    
    if (width == LAYER_WIDTH) {
        
        width = LAYER_WIDTH/4;
    }else{
        width = LAYER_WIDTH;
    }
    
    self.myLayer.bounds = CGRectMake(0, 0, width, width);

    CGPoint point =[touch locationInView:self.view];
    self.myLayer.position = point;
    self.myLayer.cornerRadius=width/2;
}

-(void)masterTest2{
    
}

-(void)masterTest{

}


-(void)masterTest3{
    
}



@end
