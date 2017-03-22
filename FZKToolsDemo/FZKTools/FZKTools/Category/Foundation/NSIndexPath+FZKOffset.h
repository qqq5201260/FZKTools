//
//  NSIndexPath+FZKOffset.h
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (FZKOffset)
/**
 *  @author JKCategories
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)previousRow;
/**
 *  @author JKCategories
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)nextRow;
/**
 *  @author JKCategories
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)previousItem;
/**
 *  @author JKCategories
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)nextItem;
/**
 *  @author JKCategories
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)nextSection;
/**
 *  @author JKCategories
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)previousSection;
@end
