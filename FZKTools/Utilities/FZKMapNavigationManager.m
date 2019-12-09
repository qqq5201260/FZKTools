//
//  FZKMapNavigationManager.m
//  FZKTools
//
//  Created by czl on 2017/7/14.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "FZKMapNavigationManager.h"
#import <UIKit/UIKit.h>
#import "UIWindow+FZKUntil.h"

@implementation FZKMapNavigationManager

#pragma mark - 调起三方导航功能
+ (void)openThirdMapNode:(CLLocationCoordinate2D)endNode{
    
    [self addActive:[self getInstalledMapAppWithEndNode:endNode] endNode:endNode];
}


+(void)addActive:(NSArray *)array endNode:(CLLocationCoordinate2D)endNode{
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"导航" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSDictionary *dic in array) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:dic[@"title"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([dic[@"title"] isEqualToString:@"苹果地图"]) {
                MKMapItem *currentLocation =[MKMapItem mapItemForCurrentLocation];
                
                MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:endNode addressDictionary:nil]];
                
                [MKMapItem openMapsWithItems:@[currentLocation,toLocation] launchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,
                                                                                           MKLaunchOptionsShowsTrafficKey:[NSNumber numberWithBool:YES]}];
            }else{
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:dic[@"url"]]];
            }
        }];
        [alertVC addAction:action];
    }
//    UINavigationController *nav = [UIWindow currentVC].navigationController;
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    // 然后再进行present操作
//    UIViewController *vc = (nav == nil ? [UIWindow currentVC] : nav);
     [[UIWindow currentVC] presentViewController:alertVC animated:YES completion:nil];
}


+ (NSArray *)getInstalledMapAppWithEndNode:(CLLocationCoordinate2D)endNode
{
    NSMutableArray *maps = [NSMutableArray array];
    
    //苹果地图
    NSMutableDictionary *iosMapDic = [NSMutableDictionary dictionary];
    iosMapDic[@"title"] = @"苹果地图";
    [maps addObject:iosMapDic];
    
    //百度地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
        NSMutableDictionary *baiduMapDic = [NSMutableDictionary dictionary];
        baiduMapDic[@"title"] = @"百度地图";
        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=%@&mode=driving&coord_type=gcj02",endNode.latitude,endNode.longitude,@"目的地"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        baiduMapDic[@"url"] = urlString;
        [maps addObject:baiduMapDic];
    }
    
    //高德地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        NSMutableDictionary *gaodeMapDic = [NSMutableDictionary dictionary];
        gaodeMapDic[@"title"] = @"高德地图";
                NSString *urlString = [NSString stringWithFormat:@"iosamap://path?sourceApplication=%@&backScheme=%@&&dlat=%f&dlon=%f&dname=目的地",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],@"commons12346001",endNode.latitude,endNode.longitude];
        gaodeMapDic[@"url"] = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [maps addObject:gaodeMapDic];
    }
    
    //谷歌地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
        NSMutableDictionary *googleMapDic = [NSMutableDictionary dictionary];
        googleMapDic[@"title"] = @"谷歌地图";
        NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",@"导航测试",@"nav123456",endNode.latitude, endNode.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        googleMapDic[@"url"] = urlString;
        [maps addObject:googleMapDic];
    }
    
    //腾讯地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]]) {
        NSMutableDictionary *qqMapDic = [NSMutableDictionary dictionary];
        qqMapDic[@"title"] = @"腾讯地图";
        NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/routeplan?from=我的位置&type=drive&tocoord=%f,%f&to=终点&coord_type=1&policy=0",endNode.latitude, endNode.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        qqMapDic[@"url"] = urlString;
        [maps addObject:qqMapDic];
    }
    
    return maps;
}

@end
