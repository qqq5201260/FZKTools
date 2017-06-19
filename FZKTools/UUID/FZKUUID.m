//
//  UUID.m
//  UUID
//
//  Created by 张昭 on 16/4/11.
//  Copyright © 2016年 张昭. All rights reserved.
//

#import "FZKUUID.h"
#import "FZKKeyChainStore.h"

@implementation FZKUUID

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[FZKKeyChainStore load:@"com.company.app.usernamepassword"];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [FZKKeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
        
    }
    return strUUID;
}

@end
