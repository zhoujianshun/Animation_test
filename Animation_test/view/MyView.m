//
//  MyView.m
//  Animation_test
//
//  Created by 周建顺 on 15/12/1.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "MyView.h"

@interface MyView()

@property (nonatomic,strong) CAGradientLayer *gradient;

@end


@implementation MyView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.gradient.frame = rect;
    self.gradient.startPoint = CGPointMake(0, 0.5);
    self.gradient.endPoint = CGPointMake(1, 0.5);
    self.gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0.8].CGColor,
                       (id)[UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0.7].CGColor,
                       (id)[UIColor colorWithRed:1.f green:1.f blue:1.f alpha:0.5].CGColor,
                       nil];
    
}



-(void)setup{

    self.backgroundColor = [UIColor clearColor];
    self.gradient = [CAGradientLayer layer];
    [self.layer insertSublayer:self.gradient atIndex:0];
   
//    self.gradient set
}

@end
