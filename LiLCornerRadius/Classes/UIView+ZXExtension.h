//
//  UIView+ZXExtension.h
//  百思不得姐
//
//  Created by 张雄 on 16/4/27.
//  Copyright © 2016年 张雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZXExtension)

@property (nonatomic,assign)CGSize size;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;
@property (nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGFloat right;
/*  */
@property (nonatomic ,assign) CGFloat centerX;
/*  */
@property (nonatomic ,assign) CGFloat centerY;

/** 在分类中声明@property属性。只会生成方法的声明，不会生成方法的实现和带有_下划线的成员变量 */
@end
