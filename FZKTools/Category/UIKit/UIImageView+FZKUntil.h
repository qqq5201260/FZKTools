//
//  UIImageView+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FZKUntil)

/**
 *  @brief  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;

- (void)setImageWithStretchableImage:(NSString*)imageName;


// 画水印
// 图片水印
- (void)setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;

- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

/**
 *  @brief  倒影
 */
- (void)reflect;

@end
