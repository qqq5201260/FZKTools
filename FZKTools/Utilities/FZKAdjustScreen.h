//
//  FZKAdjustScreen.h
//  FZKTools
//
//  Created by czl on 2017/3/22.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#ifndef FZKAdjustScreen_h
#define FZKAdjustScreen_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define ORIGIN_WIDTH 320
#define ORIGIN_HEIGHT 568
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

#define DH_INLINE static inline

// 屏幕竖直方向的比例
DH_INLINE CGFloat FZKVerticalMutiplier()
{
    return SCREEN_SIZE.height/ORIGIN_HEIGHT;
}
/**
 *  屏幕水平方向的比例
 *
 *  @return 屏幕宽:iphone5宽
 */
DH_INLINE CGFloat FZKHorizentalMutiplier()
{
    return SCREEN_SIZE.width/ORIGIN_WIDTH;
}

DH_INLINE CGPoint FZKFlexibleCenter (CGPoint iphone5Center)
{
    CGFloat x = iphone5Center.x * FZKHorizentalMutiplier();
    CGFloat y = iphone5Center.y * FZKVerticalMutiplier();
    return CGPointMake(x, y);
}

DH_INLINE CGSize FZKFlexibleSize(CGSize iphone5Size)
{
    CGFloat width = iphone5Size.width * FZKHorizentalMutiplier();
    CGFloat height = iphone5Size.height *FZKVerticalMutiplier();
    return CGSizeMake(width, height);
    
}

DH_INLINE  CGRect FZKFrameWithCenterAndSize(CGPoint iphone5Center, CGSize iphone5Size)
{
    CGRect frame;
    frame.origin.x = iphone5Center.x - iphone5Size.width/2;
    frame.origin.y = iphone5Center.y - iphone5Size.height/2;
    frame.size = iphone5Size;
    return frame;
}

DH_INLINE CGPoint FZKCenterFromFrame(CGRect frame)
{
    CGPoint center;
    center.x = frame.origin.x + frame.size.width/2;
    center.y = frame.origin.y + frame.size.height/2;
    return center;
}

DH_INLINE CGRect FZKFlexibleFrame(CGRect iphone5Frame)
{
    // 拿到iPhone5 frame的center
    CGPoint center = FZKCenterFromFrame(iphone5Frame);
    // 对center进行等比例缩放
    CGPoint flexibleCenter = FZKFlexibleCenter(center);
    // 对size进行等比例缩放
    CGSize flexibleSize = FZKFlexibleSize(iphone5Frame.size);
    // 通过center和size合成frame
    return FZKFrameWithCenterAndSize(flexibleCenter, flexibleSize);
}


#endif /* FZKAdjustScreen_h */
