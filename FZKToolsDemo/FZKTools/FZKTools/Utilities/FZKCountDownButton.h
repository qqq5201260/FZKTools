//
//  JKCountDownButton.h
//  JKCountDownButton
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FZKCountDownButton;
typedef NSString* (^CountDownChanging)(FZKCountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(FZKCountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(FZKCountDownButton *countDownButton,NSInteger tag);

@interface FZKCountDownButton : UIButton
@property(nonatomic,strong) id userInfo;
///倒计时按钮点击回调
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)countDownChanging:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)countDownFinished:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;
///停止倒计时
- (void)stopCountDown;
@end
