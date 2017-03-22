//
//  UIDevice+FZKHardware.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (FZKHardware)

+ (NSString *)platform;
+ (NSString *)platformString;


+ (NSString *)macAddress;

//Return the current device CPU frequency
+ (NSUInteger)cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)busFrequency;
//current device RAM size
+ (NSUInteger)ramSize;
//Return the current device CPU number
+ (NSUInteger)cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)totalDiskSpaceBytes;


@end
