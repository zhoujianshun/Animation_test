//
//  Test3ViewController.m
//  Animation_test
//
//  Created by 周建顺 on 15/12/1.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "Test3ViewController.h"

#import "MyView.h"

@interface Test3ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView1;
@property (weak, nonatomic) IBOutlet UIButton *button1;


@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.testView1.backgroundColor = [UIColor redColor];
    
    self.label1.textColor = [UIColor redColor];
    //self.label1.backgroundColor = [UIColor purpleColor];
    
    MyView *myView = [[MyView alloc] initWithFrame:self.testView1.frame];
    [self.view addSubview:myView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)button1Tapped:(id)sender {
    self.label1.backgroundColor = [UIColor purpleColor];
    self.testView1.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:2.f animations:^{
        self.testView1.backgroundColor= [UIColor blackColor];
        self.label1.backgroundColor = [UIColor yellowColor];
    }];
}
- (IBAction)button3Tapped:(id)sender {
    self.label1.layer.backgroundColor = [UIColor purpleColor].CGColor;
    [UIView animateWithDuration:2.f animations:^{
        self.label1.layer.backgroundColor = [UIColor yellowColor].CGColor;
    }];
    
}

- (IBAction)button2Tapped:(id)sender {
    self.label1.textColor = [UIColor redColor];
    [UIView animateWithDuration:2.f animations:^{
        self.label1.textColor = [UIColor blackColor];
    }];
}
@end
