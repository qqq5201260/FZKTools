//
//  FZKPublicMothod.m
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "FZKPublicMothod.h"
#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation FZKPublicMothod

#pragma mark - public method
#pragma mark - 类型识别:将所有的NSNull类型转化成@""
+ (id)nullToEmptyStrign:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}

#pragma mark - 拨打电话号码
+ (void)makePhoneCallWithNumber:(NSString *)number {
    NSInteger length = number.length;
    NSString *realNumber = [NSString string];
    
    for (NSInteger i = 0 ; i <length; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [number substringWithRange:range];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        NSNumber *subnum = [numberFormatter numberFromString:subString];
        if ( subnum || [subString isEqualToString:@"-"])
        {
            realNumber = [realNumber stringByAppendingString:subString];
        }
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"tel://", realNumber]]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"tel://", realNumber]]];
    }
}
#pragma mark - 计算星座
+ (NSString *)getAstroWithMonth:(int)m day:(int)d {
    NSString *astroString = @"摩羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    if (m<1||m>12||d<1||d>31){
        return @"错误日期格式!";
    }
    if(m==2 && d>29)
    {
        return @"错误日期格式!!";
    }else if(m==4 || m==6 || m==9 || m==11) {
        if (d>30) {
            return @"错误日期格式!!!";
        }
    }
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    return result;
}

#pragma mark - 计算生肖
+ (NSString *)getZodiacWithYear:(NSString *)year {
    NSInteger constellation = ([year integerValue] - 4)%12;
    NSString * result;
    switch (constellation) {
        case 0:result = @"鼠";break;
        case 1:result = @"牛";break;
        case 2:result = @"虎";break;
        case 3:result = @"兔";break;
        case 4:result = @"龙";break;
        case 5:result = @"蛇";break;
        case 6:result = @"马";break;
        case 7:result = @"羊";break;
        case 8:result = @"猴";break;
        case 9:result = @"鸡";break;
        case 10:result = @"狗";break;
        case 11:result = @"猪";break;
        default:
            break;
    }
    return result;
}

#pragma mark - 私有方法
/*************************************分割线*************************************/
//将NSDictionary中的Null类型的项目转化成@""
+ (NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self nullToEmptyStrign:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

//将NSDictionary中的Null类型的项目转化成@""
+ (NSArray *)nullArr:(NSArray *)myArr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        
        obj = [self nullToEmptyStrign:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}

//将Null类型的项目转化成@""
+ (NSString *)nullToString
{
    return @"";
}
/*************************************分割线*************************************/

#pragma mark - 指纹识别
+ (void)fingerprintIdentificationWithSuccess:(void(^)(void))successful fail:(void(^)(NSError *))fail {
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    // 判断当前系统版本
    if (version < 8.0 )  {
        NSLog(@"系统版本太低,请升级至最新系统");
        return;
    }
    // 1> 实例化指纹识别对象
    LAContext *laCtx = [[LAContext alloc] init];
    
    // 2> 判断当前设备是否支持指纹识别功能.
    if (![laCtx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        
        // 如果设备不支持指纹识别功能
        NSLog(@"该设备不支持指纹识别功能");
        
        return;
    };
    [laCtx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹登陆" reply:^(BOOL success, NSError *error) {
        // 如果成功,表示指纹输入正确.
        if (success) {
            NSLog(@"指纹识别成功!");
            successful();
        } else {
            NSLog(@"指纹识别错误,请再次尝试");
            fail(error);
        }
    }];
}


/*! 自己写正则传入进行判断*/
+ (BOOL)validateData:(NSString *)data withRegEx: (NSString *)RegEx {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", RegEx];
    return [predicate evaluateWithObject: data];
}
//邮箱
+ (BOOL)validateEmail:(NSString *)data
{
    NSString *RegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self baseValidateForRegEx:RegEx data:data];
}

//手机号码验证
+ (BOOL)validateMobile:(NSString *)data
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *RegEx = @"^((17[0-9])|(13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//车牌号验证
+ (BOOL)validateCarNo:(NSString *)data
{
    NSString *RegEx = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//车型
+ (BOOL)validateCarType:(NSString *)data
{
    NSString *RegEx = @"^[\u4E00-\u9FFF]+$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//用户名
+ (BOOL)validateUserName:(NSString *)data
{
    NSString *RegEx = @"^[A-Za-z0-9]{6,20}+$";
    return [self baseValidateForRegEx:RegEx data:data];
}
//密码
+ (BOOL)validatePassword:(NSString *)data
{
    NSString *RegEx = @"^[a-zA-Z0-9]{6,20}+$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//昵称
+ (BOOL)validateNickname:(NSString *)data
{
    NSString *RegEx = @"^[\u4e00-\u9fa5]{4,8}$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//身份证号
+ (BOOL)validateIdentityCard: (NSString *)data
{
    NSString *RegEx = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self baseValidateForRegEx:RegEx data:data];
}

//手机验证码
+ (BOOL)validateCheckCode:(NSString *)data {
    NSString *RegEx = @"\\d{4}";
    return [self baseValidateForRegEx:RegEx data:data];
}
//判断URL是否能够打开
+ (void)validateUrl:(NSString *)url block:(void(^)(BOOL))block {
    NSURL *candidate = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:candidate];
    [request setHTTPMethod:@"HEAD"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error %@",error);
        if (!request && error) {
            NSLog(@"URL不可用");
            block(NO);
        }else{
            NSLog(@"URL可用:%@",request);
            block(YES);
        }
    }];
    [task resume];
}

#pragma mark - private
+ (BOOL)baseValidateForRegEx:(NSString *)RegEx data:(NSString *)data
{
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", RegEx];
    if (([card evaluateWithObject:data])) {
        return YES;
    }
    return NO;
}

@end
