//
//  FZKMapNavigationManager.h
//  FZKTools
//
//  Created by czl on 2017/7/14.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface FZKMapNavigationManager : NSObject

/**
 调起三方地图应用导航
 
 
 @param endNode 终点
 */
+ (void)openThirdMapNode:(CLLocationCoordinate2D)endNode;


@end
