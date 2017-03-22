//
//  FZKPublicMothod.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZKPublicMothod : NSObject

/**
 *  将对象中的Null类型转化成@""
 *
 *  @param myObj 被转化对象
 *
 *  @return 返回对象
 */
+ (id)nullToEmptyStrign:(id)myObj;

/**
 *  拨打电话号码
 *
 *  @param number 号码字符串
 */
+ (void)makePhoneCallWithNumber:(NSString *)number;

/**
 *  根据出生日期计算星座
 *
 *  @param m 出生月
 *  @param d 出生日
 *
 *  @return 星座字符串
 */
+ (NSString *)getAstroWithMonth:(int)m day:(int)d;

/**
 *  计算生肖
 *
 *  @param year 出生年
 *
 *  @return 生肖字符串
 */
+ (NSString *)getZodiacWithYear:(NSString *)year;

/**
 *  指纹识别
 *
 *  @param successful 成功回调
 *  @param fail       失败回调
 */
+ (void)fingerprintIdentificationWithSuccess:(void(^)(void))successful fail:(void(^)(NSError *))fail;


/*! 自己写正则传入进行判断*/
+ (BOOL)validateData:(NSString *)data withRegEx: (NSString *)RegEx;
//邮箱
+ (BOOL)validateEmail:(NSString *)data;
//手机号码验证
+ (BOOL)validateMobile:(NSString *)data;
//车牌号验证
+ (BOOL)validateCarNo:(NSString *)data;
//车型
+ (BOOL)validateCarType:(NSString *)data;
//用户名
+ (BOOL)validateUserName:(NSString *)data;
//密码
+ (BOOL)validatePassword:(NSString *)data;
//昵称
+ (BOOL)validateNickname:(NSString *)data;
//身份证号
+ (BOOL)validateIdentityCard: (NSString *)data;
//手机验证码
+ (BOOL)validateCheckCode: (NSString *)data;
//判断URL是否能够打开
+ (void)validateUrl:(NSString *)url block:(void(^)(BOOL))block;



@end
