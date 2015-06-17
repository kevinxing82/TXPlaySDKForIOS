//
//  TXSNetConnectionUtils.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/8.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXSNetConnectionUtils : NSObject
extern NSString* const baseUrl;
//send data key
extern NSString*  kSdkVer;                //SDK版本
extern NSString*  kAppID;                   //应用发布ID
extern NSString*  kPackageName;    //应用的包名
extern NSString*  kChannel;               //自定义渠道号，多个用逗号分隔
extern NSString*  kTest;                      //测试：是-1，否-0
extern NSString*  kType;                     //1.综合包，2.无积分包，3.积分包，4.视频包
extern NSString* kNetworkType;        //网络类型
extern NSString* kNetworkSubType; //网络子类型
extern NSString* kUid;                         //用户ID，保存在手机上，有此项时以下项忽略
extern NSString* kUa;                         //机型
extern NSString* kIMEI;                       //手机标识串
extern NSString* kSysVer;                  //系统版本
extern NSString* kP;                            //手机号码
extern NSString* kIMSI;                       //手机卡的IMSI标识串
extern NSString* kWidth;                    //屏幕宽
extern NSString* kHeight;                   //屏幕高

+(void)requestAdvertisementDatas:(NSString*)sdkver
                                     appID:(NSString*) _appID
                      packageName:(NSString*) _packageName
                                  channel:(NSString*) _channel
                                         test:(NSString*) _test
                                        type:(NSString*) _type
                         networkType:(NSString*) _networkType
                  networkSubType:(NSString*) _networkSubType
                                          uid:(NSString*) _uid
                                           ua:(NSString*) _ua
                                         imei:(NSString*) _imei
                                     sysver:(NSString*) _sysver
                                              p:(NSString*) _p
                                          imsi:(NSString*) _imsi
                                        width:(NSString*) _width
                                      height:(NSString*) _height;

@end
