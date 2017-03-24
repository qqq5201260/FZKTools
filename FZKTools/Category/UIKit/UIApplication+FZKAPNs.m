


//
//  UIApplication+FZKAPNs.m
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "UIApplication+FZKAPNs.h"



@interface UIApplication ()



@end

@implementation UIApplication (FZKAPNs)

+ (void)registerAPNsSetDeledate:(id <UNUserNotificationCenterDelegate>)responder;{
    
   UIApplication *application = [UIApplication sharedApplication];
    CGFloat vision = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (vision >= 10.0 ) {
        
        #ifdef NSFoundationVersionNumber_iOS_9_x_Max
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error) {
                NSLog(@"request authorization succeeded!");
            }
        }];
        [UNUserNotificationCenter currentNotificationCenter].delegate = responder;
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
        #endif
        
    }
   else if (vision >= 8.0) { //iOS8.0以后注册方法与之前有所不同，需要要分别对待
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes: (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge) categories: nil];
        
        [application registerUserNotificationSettings: settings];
        
        [application registerForRemoteNotifications];
        
    }else{ //iOS8.0以前版本的注册方法
        
        [application registerForRemoteNotificationTypes: (UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge)];
    }
    
}
@end
