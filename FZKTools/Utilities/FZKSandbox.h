//
//  FZKSandbox.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZKSandbox : NSObject


/**
 定义沙盒目录类型

 - DocumentType:Document目录
 - LibraryType: Library目录
 - CacheType: Library中的Cache
 - TempType: temp目录
 */
typedef NS_ENUM(NSUInteger, SandboxType) {
    SandboxTypeDocument = 0,
    SandboxTypeLibrary,
    SandboxTypeCache,
    SandboxTypeTemp,
};

//获取程序的根目录（home目录）
+ (NSString *)homePath;

//获取Document目录
+ (NSString *)documentPath;

//获取Library目录
+ (NSString *)libraryPath;

//获取Library中的Cache
+ (NSString *)cachePath;

//获取temp目录
+ (NSString *)tempPath;

/**
 *  通过文件名获取沙盒文件路径
 *
 *  @param fileName 文件名
 *  @param type     路径目录类型
 *
 *  @return 文件路径
 */
+ (NSString *)sandboxFilePathWithFileName:(NSString *)fileName pathType:(SandboxType)type;

/**
 *  从文件中初始化plist数组(如果沙盒中没找到文件,会在bundle中查找)
 *
 *  @param plistName plist名字
 *  @param type      沙盒路径类型
 *
 *  @return 数组
 */
+ (NSMutableArray *)dataArrayWithPlistName:(NSString *)plistName pathType:(SandboxType)type;



@end
