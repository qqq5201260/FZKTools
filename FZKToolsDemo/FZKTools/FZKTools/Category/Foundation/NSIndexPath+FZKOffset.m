//
//  NSIndexPath+FZKOffset.m
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "NSIndexPath+FZKOffset.h"
#import <UIKit/UIKit.h>

@implementation NSIndexPath (FZKOffset)

- (NSIndexPath *)previousRow
{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

- (NSIndexPath *)nextRow
{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

- (NSIndexPath *)previousItem
{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}

- (NSIndexPath *)nextItem
{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}

- (NSIndexPath *)nextSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}

- (NSIndexPath *)previousSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

@end
