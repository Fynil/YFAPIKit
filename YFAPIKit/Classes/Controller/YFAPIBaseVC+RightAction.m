//
//  YFAPIBaseVC+RightAction.m
//  YFAPIKit
//
//  Created by Fynil on 2018/2/5.
//  Copyright © 2018年 Fynil. All rights reserved.
//

#import "YFAPIBaseVC+RightAction.h"
#import "YFRiskItemVC.h"
#import "YFSharingDataListVC.h"
#import "YFIDCardGenerator.h"

@implementation YFAPIBaseVC (RightAction)

- (void)requestTokenWithDic:(NSDictionary *)paramDic path:(NSString *)path complete:(void (^)(NSDictionary *))complete {
    DemoLog(@"\n👉👉👉👉👉👉👉👉👉👉 \n");
    DemoLog(@"\n 请求地址:\n %@\n\n 请求报文: \n%@",path, paramDic.prettyString);
    __block NSDictionary *jsonObject = nil;
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *param = paramDic.yfJsonString;
    
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    request.timeoutInterval = 40;
    
    [request setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.showHud) {
            [SVProgressHUD show];
        } else {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        }
    });
    
    NSURLSessionDataTask *task =
    [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.showHud) {
                [SVProgressHUD dismiss];
            }else {
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
        });
        if (error || !data) {
            DemoLog(@"请求出错：%@",error.description);
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(@{@"ret_code":@"LE9001",@"ret_msg":error.localizedDescription});
            });
            return;
        }
        jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        DemoLog(@"\n👈👈👈👈👈👈👈👈👈👈");
        DemoLog(@"返回报文:\n %@",jsonObject.prettyString);
        DemoLog(@"\nret_msg = %@",jsonObject[@"ret_msg"]);
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(jsonObject);
        });
    }];
    [task resume];
}

- (void)refreshOrder {
    [self refreshTimeRelatedTexts];
}

- (void)refreshTimeStamp {
    [self refreshTimeRelatedTexts];
}

- (void)refreshTimeRelatedTexts {
    NSArray *arr = @[@"timestamp",@"time_stamp",@"dt_order",@"no_order",@"request_time"];
    NSString *time = [YFApiUtil timeStamp];
    for (NSString *key in arr) {
        YFTextField *field = [self.tableView field:key];
        if (!field) {
            continue;
        }
        field.text = time;
        if ([key isEqualToString:@"no_order"]) {
            field.text = [YFApiUtil generateOrderNO];
        }
    }
}

- (void)requestToken {
    
}

- (void)generateIDCard {
    NSString *idcard = [YFIDCardGenerator generateIDCard];
    [self.tableView field:@"id_no"].text = idcard;
}

- (void)configRiskItem {
    YFRiskItemVC *riskItemVC = [YFRiskItemVC new];
    YFTextField *field = [self.tableView field:@"risk_item"];
    riskItemVC.riskItem = ^(NSString *riskItem) {
        field.text = riskItem;
    };
    [self.navigationController pushViewController:riskItemVC animated:YES];
}

- (void)configShareingData {
    YFSharingDataListVC *sharingDataVC = [YFSharingDataListVC new];
    sharingDataVC.exitParam = ^(NSDictionary *exitParam) {
        [self.tableView field:@"shareing_data"].text = exitParam[@"shareing_data"];
    };
    [self.navigationController pushViewController:sharingDataVC animated:YES];
}

- (void)deviceID {
    [self.tableView field:@"device_id"].text = [YFApiUtil uuidString];
}

- (void)deviceIPAddress {
    NSString *ip = [YFApiUtil ipAddress];
    [self.tableView field:@"source_ip"].text = ip;
    [self.tableView field:@"frms_ip_addr"].text = ip;
}

- (void)locateUser {
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务没有开启！请设置打开！");
        return;
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.locationMgr requestWhenInUseAuthorization];
        });
    }
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationMgr.distanceFilter = 10.0;
    [self.locationMgr startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coordinate = location.coordinate;   //经纬度
    [self.tableView field:@"device_location"].text = [NSString stringWithFormat:@"%.3f+%.3f",coordinate.longitude,coordinate.latitude];
    [manager stopUpdatingLocation];
}

@end
