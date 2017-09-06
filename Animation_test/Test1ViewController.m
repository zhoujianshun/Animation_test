//
//  Test1ViewController.m
//  Animation_test
//
//  Created by 周建顺 on 15/7/1.
//  Copyright (c) 2015年 周建顺. All rights reserved.
//

#import "Test1ViewController.h"
#define LAYER_WIDTH 100.f
#define LAYER_HEIGHT 100.f
@interface Test1ViewController()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic,strong) CALayer *myLayer;

@end

@implementation Test1ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //[self addLayer];
    [self.view bringSubviewToFront:self.startButton];
    [self.view bringSubviewToFront:self.image];
}


- (IBAction)startTapped:(id)sender {
    
    [self startAnimation];
}

- (IBAction)pathStartTapped:(id)sender {
    
    [self startPathAnimation];
}
- (IBAction)groupAnimationTapped:(id)sender {
    
    CAAnimationGroup *animationGroup=[CAAnimationGroup animation];
    
    //2.设置组中的动画和其他属性
    //CABasicAnimation *basicAnimation=[self rotationAnimation];//CAKeyframeAnimation *keyframeAnimation=[self translationAnimation];
    animationGroup.animations=@[[self rotationAnimation],[self pathAnimation]];
    
    animationGroup.delegate=self;
    animationGroup.duration=10.0;//设置动画时间，如果动画组中动画已经设置过动画属性则不再生效
    animationGroup.beginTime=CACurrentMediaTime()+5;//延迟五秒执行
    
    //3.给图层添加动画
    [self.image.layer addAnimation:animationGroup forKey:nil];
}

-(CAAnimation*)pathAnimation{

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(self.image.center.x, self.image.center.y)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(120, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(160, 270)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(130, 380)];
    
    animation.values = @[value1,value2,value3,value4];
    animation.duration = 10.f;
    animation.removedOnCompletion = YES;
    animation.repeatCount = 1;
    return animation;
}

-(CAAnimation*)rotationAnimation{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotation.fromValue = [NSNumber numberWithFloat:0.f];
    rotation.toValue = [NSNumber numberWithFloat:M_PI*2];
    rotation.duration = 10.f;
    rotation.repeatCount = 1;
    rotation.removedOnCompletion = YES;
    return rotation;

}

-(void)addLayer{
    
    self.myLayer = [[CALayer alloc] init];
    self.myLayer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    self.myLayer.bounds = CGRectMake(0, 0, LAYER_WIDTH, LAYER_HEIGHT);
    self.myLayer.position = CGPointMake(100, 100);
    self.myLayer.cornerRadius = LAYER_WIDTH/2;
    // 阴影；
    
    self.myLayer.shadowColor = [UIColor grayColor].CGColor;
    self.myLayer.shadowOffset = CGSizeMake(2, 2);
    self.myLayer.shadowOpacity = 0.8;
    
    
    [self.view.layer addSublayer:self.myLayer];
   
    
}

// 关键帧动画，通过values设置关键帧动画
-(void)startAnimation{

  
    
    [self.image.layer addAnimation:[self pathAnimation] forKey:@"positionAnim"];

}


-(void)startPathAnimation{

    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置路径
    //绘制贝塞尔曲线
    CGPathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.image.layer.position.x, self.image.layer.position.y);//移动到起始点
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);//绘制二次贝塞尔曲线
    
    keyframeAnimation.path=path;//设置path属性
    CGPathRelease(path);//释放路径对象
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime()+1;//设置延迟2秒执行
    
    
    //3.添加动画到图层，添加动画后就会执行动画
    [self.image.layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];

}


// 翻转动画
-(void)startFlipAnimation{
    
    //[rotation setValue:[NSNumber numberWithFloat:M_2_PI] forKey:@"KCBasicAnimationProperty_ToValue"];
    [self.image.layer addAnimation:[self rotationAnimation] forKey:@"1213"];
    
    
}
@end
