//
//  UIImageView+CornerRadius.m
//  LiLCornerRadius
//
//  Created by wajiu on 2017/9/8.
//  Copyright © 2017年 wajiu. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <objc/message.h>
#import <objc/runtime.h>

@interface UIImageView ()
@property(nonatomic,assign)UIRectCorner rectCornerType;
@property(nonatomic,assign)CGFloat radius;
@property(nonatomic,assign)BOOL hadObserver;
@property(nonatomic,assign)CGSize originSize;

@end

const char llprocessedImage;

@implementation UIImageView (CornerRadius)
-(id)initWithRectCornerType:(UIRectCorner)cornerType radius:(CGFloat)radius{
    if (self = [super init]) {
        self.hadObserver = YES;
        self.rectCornerType = cornerType;
        self.radius = radius;
        [[self class] ll_swizzleDealloc];
        [[self class] ll_swizzleLayoutSubviews];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if (!newImage) {
            return;
        }else if ([objc_getAssociatedObject(newImage, &llprocessedImage) boolValue]){
            return;
        }
        self.originImage = newImage;
        [self ll_processingImageWithImage:newImage];
    }
}
-(void)ll_processingImageWithImage:(UIImage *)image{
    CGSize size = self.bounds.size;
    if (!image || size.width <=0 || size.height <=0) {
        return;
    }
    self.originSize = size;
    UIRectCorner cornerType = self.rectCornerType;
    CGFloat radius = 0;
    if (cornerType == UIRectCornerAllCorners) {
        radius = self.bounds.size.width/2.0;
    }else{
        radius = self.radius;
    }
    if (radius <=0) {
        return;
    }
    
    UIColor *backColor = self.llBackgroundColor;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, backColor?YES:NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    if (!contextRef) {
        UIGraphicsEndImageContext();
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:cornerType cornerRadii:CGSizeMake(radius, radius)];
    if (backColor) {
        UIBezierPath *backPath = [UIBezierPath bezierPathWithRect:self.bounds];
        [backColor setFill];
        [backPath fill];
    }
    [cornerPath addClip];
    [image drawInRect:self.bounds];
//    [self.layer renderInContext:contextRef];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &llprocessedImage, @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}
-(void)drawBorder:(UIBezierPath *)path{
    if (self.borderWidth > 0 && self.borderColor) {
        path.lineWidth = self.borderWidth;
        [self.borderColor setStroke];
        [path stroke];
    }
}

+(void)ll_swizzleDealloc{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ll_swizzleSelectorwithClass:self originSelector:NSSelectorFromString(@"dealloc") newSelector:@selector(ll_dealloc)];
    });
}
-(void)ll_dealloc{
    if (self.hadObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
    [self ll_dealloc];
}

+(void)ll_swizzleLayoutSubviews{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ll_swizzleSelectorwithClass:self originSelector:@selector(layoutSubviews) newSelector:@selector(ll_layoutSubViews)];
    });
}
-(void)ll_layoutSubViews{
    [self ll_layoutSubViews];
    if (self.hadObserver) {
        if (!CGSizeEqualToSize(self.bounds.size, self.originSize)) {
            [self ll_processingImageWithImage:self.originImage ];
        }
        
    }
    
}
+(void)ll_swizzleSelectorwithClass:(Class)class originSelector:(SEL)originSelector newSelector:(SEL)newSelector{
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    BOOL addMethod = class_addMethod(class, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (addMethod) {
        class_replaceMethod(class, newSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, newMethod);
    }
    
}
-(void)setRadius:(CGFloat)radius{
    objc_setAssociatedObject(self, @selector(radius), @(radius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)radius{
    return  [objc_getAssociatedObject(self, _cmd) floatValue];
}
-(void)setRectCornerType:(UIRectCorner)rectCornerType{
    objc_setAssociatedObject(self, @selector(rectCornerType), @(rectCornerType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIRectCorner)rectCornerType{
    return [objc_getAssociatedObject(self, _cmd) unsignedLongValue];
}
-(CGFloat)borderWidth{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
-(void)setBorderWidth:(CGFloat)borderWidth{
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)borderColor{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setBorderColor:(UIColor *)borderColor{
    objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)hadObserver{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(void)setHadObserver:(BOOL)hadObserver{
    objc_setAssociatedObject(self, @selector(hadObserver), @(hadObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)llBackgroundColor{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setLlBackgroundColor:(UIColor *)llBackgroundColor{
    objc_setAssociatedObject(self, @selector(llBackgroundColor), llBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImage *)originImage{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setOriginImage:(UIImage *)originImage{
    objc_setAssociatedObject(self, @selector(originImage), originImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGSize)originSize{
    return CGSizeFromString(objc_getAssociatedObject(self, _cmd));
}
-(void)setOriginSize:(CGSize)originSize{
    objc_setAssociatedObject(self, @selector(originSize), NSStringFromCGSize(originSize), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
