//
//  UITextField+FZKUntil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (FZKUntil)


/**
 设置可以输入的长度
 */
@property (assign, nonatomic)  NSInteger maxLength;//if <=0, no limit

@end
