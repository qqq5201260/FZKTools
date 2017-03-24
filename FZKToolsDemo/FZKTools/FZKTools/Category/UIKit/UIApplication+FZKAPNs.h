//
//  UIApplication+FZKAPNs.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface UIApplication (FZKAPNs)


/**
 注册 apns responder 必须添加代理<UNUserNotificationCenterDelegate> 并实现代理

 @param responder iOS10 以后设置代理
 */
+ (void)registerAPNsSetDeledate:(id <UNUserNotificationCenterDelegate>)responder;

@end
