//
//  NSString+FZKUtils.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FZKUtils)

/**
 *  根据各种情况判断字符串是否为空 是空返回yes
 */
+ (BOOL)isEmptyString:(NSString *)str;
/**
 *  将中文字符串转为拼音
 *
 *  @param string 中文
 *
 *  @return 拼音
 */
+ (NSString *)pinyinWithChineseString:(NSString *)string;


/**
 获取拼音的首字母大写

 @param string 中文
 @return 中文拼音首字母大写
 */
+ (NSString *)pinyinWithChineseFirstUpper:(NSString *)string;

/**
 获取拼音的首字母小写
 
 @param string 中文
 @return 中文拼音首字母小写
 */
+ (NSString *)pinyinWithChineseFirstLower:(NSString *)string;
@end
