//
//  FZKMapNavigationManager.m
//  FZKTools
//
//  Created by czl on 2017/7/14.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "FZKMapNavigationManager.h"
#import <UIKit/UIKit.h>


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
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
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
        //        NSString *urlString = [NSString stringWithFormat:@"https://uri.amap.com/navigation?to=%f,%f,endpoint&callnative=1&mode=car",endNode.latitude,endNode.longitude];
        
        
        //        CLLocationCoordinate2D corrds2 = endNode;
        //            NSString * urlString = @"";
        //            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
        //        NSString *urlString = [NSString stringWithFormat:@"iosamap://viewMap?sourceApplication=%@&poiname=目的地&lat=%f&lon=%f&dev=1",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],endNode.latitude,endNode.longitude];
        //                }
        
        
        gaodeMapDic[@"url"] = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [maps addObject:gaodeMapDic];
        
        
        
        //        float shopLat = gcj02Coord.latitude;
        //        float shoplng = gcj02Coord.longitude;
        //
        //        NSString *urlString = [NSString stringWithFormat:@"iosamap://path?sourceApplication=jikexiue&backScheme=jkxe&slat=%f&slon=%f&sname=我的位置&dev=1&t=1",self.userLocation.location.coordinate.latitude, self.userLocation.location.coordinate.longitude];
        //
        //        if (shopLat != 0 && shoplng != 0) {
        //            urlString = [NSString stringWithFormat:@"%@&dlat=%f&dlon=%f&dname=%@", urlString, shopLat, shoplng ,_orderModel.addressStr];
        //        }else{
        //            urlString = [NSString stringWithFormat:@"%@&dname=%@",urlString, _orderModel.addressStr];
        //        }
        //
        //        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //
        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:^(BOOL success) {
        //
        //        }];
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
