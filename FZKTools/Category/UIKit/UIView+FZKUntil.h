//
//  UIView+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FZKUntil)

@property (nonatomic,assign)CGFloat x;
@property (nonatomic,assign)CGFloat y;

@property CGPoint origin;
@property CGSize size;

@property (readonly)CGPoint bottomLeft;
@property (readonly)CGPoint bottomRight;
@property (readonly)CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;


@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

/**
 *  @brief  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *viewController;

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)screenshot;


@end
