//
//  UIImageView+CornerRadius.h
//  LiLCornerRadius
//
//  Created by wajiu on 2017/9/8.
//  Copyright © 2017年 wajiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CornerRadius)
@property(nonatomic,strong)UIColor *llBackgroundColor;
@property(nonatomic,strong)UIImage *originImage;
@property(nonatomic,assign)CGFloat borderWidth;
@property(nonatomic,strong)UIColor *borderColor;
-initWithRectCornerType:(UIRectCorner)cornerType radius:(CGFloat)radius;

@end
