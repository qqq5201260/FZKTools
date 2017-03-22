//
//  UIImage+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FZKUntil)


/**
 *  @brief  截图指定view成图片
 *
 *  @param view 一个view
 *
 *  @return 图片
 */
+ (UIImage *)captureWithView:(UIView *)view;



/**
 截取原图生成新的图片

 @param myImageRect 在原图的rect
 @param bigImage 原图
 @return 截图
 */
+ (UIImage *)getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param aView    指定的view
 *  @param maxWidth 宽的大小 0为view默认大小
 *
 *  @return 截图
 */
+ (UIImage *)screenshotWithView:(UIView *)aView limitWidth:(CGFloat)maxWidth;


/**
 根据gif动图生成UImage

 @param name 图片名
 @return 图片
 */
+ (UIImage *)animatedGIFNamed:(NSString *)name;


/**
 根据二进制data数据生成gif图片

 @param data data
 @return 图片
 */
+ (UIImage *)animatedGIFWithData:(NSData *)data;


//- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size;


/**
 *  合成加半透明水印
 *
 *  @param maskImage 水印图
 *  @param rect      水印图位置
 *
 *  @return 图片
 */
- (UIImage *)addMsakImage:(UIImage *)maskImage msakRect:(CGRect)rect;

/**
 *  压缩图片
 *
 *  @return 压缩后的图片
 */
- (UIImage *)compressImage;

/**
 *  改变图片大小
 *
 *  @param size 改变后的尺寸
 *
 *  @return 改变后的图片
 */
- (UIImage *)changeImageSize:(CGSize)size;

/**
 *  截取部分图像
 *
 *  @param rect 截取位置
 *
 *  @return 截取后的图片
 */
- (UIImage*)clipSubImage:(CGRect)rect;

/**
 *  等比例缩放
 *
 *  @param size 缩放尺寸
 *
 *  @return 缩放后的图片
 */
- (UIImage*)scaleToSize:(CGSize)size;

//图片切成圆形
- (instancetype)circleImage;
+ (instancetype)circleImage:(NSString *)image;


/*
 1：图片size
 2：图片圆角半径
 */
-(UIImage *)converSize:(CGSize)size radius:(CGFloat)radius;

@end
