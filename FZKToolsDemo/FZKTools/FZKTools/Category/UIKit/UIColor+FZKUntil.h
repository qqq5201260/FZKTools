//
//  UIColor+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FZKUntil)

//
//+ (UIColor *)colorWithHex:(UInt32)hex;
//+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;


/**
 根据16进制字符串获取颜色

 @param hexString 16进制字符串
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/*
 获取16进制字符串 如#1215F6
 */
- (NSString *)HEXString;


/**
 直接填写0-255整数设置颜色

 @param red red
 @param green green
 @param blue blue
 @param alpha alph
 @return color
 */
+ (UIColor *)colorWithWholeRed:(NSInteger)red
                            green:(NSInteger)green
                             blue:(NSInteger)blue
                            alpha:(CGFloat)alpha;

/**
 直接填写0-255整数设置颜色
 
 @param red red
 @param green green
 @param blue blue
 
 @return color
 */
+ (UIColor *)colorWithWholeRed:(NSInteger)red
                            green:(NSInteger)green
                             blue:(NSInteger)blue;


/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)randomColor;

@end
