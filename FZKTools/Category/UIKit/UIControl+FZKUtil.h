//
//  UIControl+FZKUtil.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UIControl (FZKUtil)

/// Set the sound for a particular control event (or events).//设置合理的特定控制事件
/// @param name The name of the file. The method looks for an image with the specified name in the application’s main bundle.//文件名
/// @param controlEvent A bitmask specifying the control events for which the action message is sent. See “Control Events” for bitmask constants. 有UIControlEvents 事件才可以使用
//不同事件增加不同声音
- (void)setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end
