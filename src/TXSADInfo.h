//
//  TXSADInfo.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/9.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXSADInfo : NSObject
//<ad uid='65' logid='4618' channel='c1' id='31' appid='93' model='1' position='1' unit_integral='' scale_integral='' status='1' create_time='2015-02-02 11:21:39' adid='900001' second='0' ad_channel='' adName='淘宝手机助手' size='7.3' packageName='com.taobao.appcenter' fileName='900001.apk' next_adid='900002' src='http://umuad.com/sdkAssets/adShow/900001/1_4.jpg' next_src='http://umuad.com/sdkAssets/adShow/900002/1_4.jpg' url='http://umuad.com/index.php?controller=SDK_Interface&amp;action=download&amp;logid=4618&amp;test=1' update_url='http://umuad.com/sdkAssets/appUpdate/.apk'/>

@property (nonatomic,copy) NSString* ID;
@property (nonatomic,copy)NSString* appID;
@property (nonatomic,copy) NSString* uid;
@property (nonatomic,copy) NSString* logid;
@property (nonatomic,copy) NSString* channel;
@property (nonatomic,copy) NSString* model;
@property (nonatomic,copy) NSString* position;
@property (nonatomic,copy) NSString* unit_integral;
@property (nonatomic,copy) NSString* scale_integral;
@property (nonatomic,copy) NSString* status;
@property (nonatomic,copy) NSString* create_time;
@property (nonatomic,copy) NSString* second;
@property (nonatomic,copy) NSString* ad_channel;
@property (nonatomic,copy) NSString* adName;
@property (nonatomic,copy) NSString* size;
@property (nonatomic,copy) NSString* packageName;
@property (nonatomic,copy) NSString* fileName;
@property (nonatomic,copy) NSString* adid;
@property (nonatomic,copy) NSString* next_adid;
@property (nonatomic,copy) NSString* src;
@property (nonatomic,copy) NSString* next_src;
@property (nonatomic,copy) NSString* url;
@property (nonatomic,copy) NSString* update_url;

-(id)initWithDic:(NSDictionary*)dic;

@end
