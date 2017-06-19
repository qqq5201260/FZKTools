//
//  UIWindow+FZKUntil.m
//  FZKTools
//
//  Created by czl on 2017/4/10.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "UIWindow+FZKUntil.h"

@implementation UIWindow (FZKUntil)

/**
 获取当前顶层VC
 
 @return 活动vc
 */
+ (UIViewController *)currentVC{

   return [self topVC:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topVC:(UIViewController *)vc{

    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tar = (UITabBarController *)vc;
        return [self topVC:tar.selectedViewController];
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        return [self topVC:nav.visibleViewController];
    }
    if (vc.presentedViewController) {
        return [self topVC:vc.presentedViewController];
    }
    return vc;
}
@end
