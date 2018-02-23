//
//  ViewController.m
//  LiLCornerRadius
//
//  Created by wajiu on 2017/9/8.
//  Copyright © 2017年 wajiu. All rights reserved.
//
// help me
#import "ViewController.h"
#import "UIImageView+CornerRadius.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithRectCornerType:UIRectCornerAllCorners radius:20.f];
    imageView.llBackgroundColor = [UIColor redColor];
    [imageView setFrame:CGRectMake(130, 80, 1, 1)];
    [self.view addSubview:imageView];
    
    
    UIImageView *imageViewSecond = [[UIImageView alloc] initWithRectCornerType:UIRectCornerBottomLeft | UIRectCornerTopRight radius:20.f];
    [imageViewSecond setFrame:CGRectMake(130, 280, 150, 150)];
    imageViewSecond.borderColor = [UIColor greenColor];
    imageViewSecond.borderWidth = 20;
    imageViewSecond.llBackgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageViewSecond];
    
    
    UIImageView *imageViewThird = [[UIImageView alloc] initWithRectCornerType:UIRectCornerBottomRight | UIRectCornerTopLeft radius:20.f];
    [imageViewThird setFrame:CGRectMake(130, 480, 150, 150)];
    [self.view addSubview:imageViewThird];
    
    
#pragma mark - setImage anytime
    imageView.image = [UIImage imageNamed:@"mac_dog"];
    imageViewSecond.image = [UIImage imageNamed:@"mac_dog"];
    imageViewThird.image = [UIImage imageNamed:@"mac_dog"];
    [imageView setFrame:CGRectMake(0, 80, 300, 300)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
