//
//  UINavigationController+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (FZKUntil)


/**
 VC跳转动画方式及时间

 @param controller 目标VC
 @param transition 转动方式
 @param time 动画时间 默认0.5s
 */
- (void)pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition duration:(CGFloat)time;


/**
 pop 返回动画

 @param transition 动画方式
 @param time 动画时间 默认0.5s
 @return 目标VC
 */
- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition duration:(CGFloat)time;


@end
