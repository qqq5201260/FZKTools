//
//  FZKConvert.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FZKConvert : NSObject

/**
 *  时间戳转换为日期NSDate
 *
 *  @param timestamp 时间戳
 *
 *  @return 时间字符串
 */
+ (NSDate *)dateWithTimestamp:(double)timestamp;

/**
 *  日期NSDate转换为时间戳
 *
 *  @param date 时间date
 *
 *  @return 时间戳
 */
+ (double)timestampWithDate:(NSDate *)date;


/**
 *  JSON字符串转换为字典
 *
 *  @param jsonString JSON格式的字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  字典转换为JSON字符串
 *
 *  @param dic 字典
 *
 *  @return JSON格式的字符串
 */
+ (NSString*)jsonStringWithDictionary:(NSDictionary *)dic;

@end
