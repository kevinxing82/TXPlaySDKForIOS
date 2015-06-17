//
//  TXSADInfo.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/9.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSADInfo.h"

@implementation TXSADInfo

//uid                       用户ID，应将数据保存在手机上
//logid                    日志ID
//channel              单个自定义渠道号
//model                 展示模式：1-横幅，2-擦屏，3-视频，4-广告墙，5-退屏，6-启屏，7-push插件（直接下载安装）
//position               展示位置：1-上，2-中，3-下
//src                       资源地址
//url                        广告地址
//size                      安装包大小，单位M
//fileName              安装包文件名(文件名不能修改)
//packageName    包名
//second                地址是二级页面（点击调用WebView）：1-是，0-否
//nextSrc                下一个资源地址，提前缓存
//adName              广告名称，用于下载时提示
//updateTime         应用最后更新时间：YYYY-mm-dd HH:ii:ss
//updateText          更新提示文字
//updateUrl             应用下载地址

-(id)initWithDic:(NSDictionary*)dic
{
    if(self=[super init])
    {
        for (NSString* key  in dic) {
            if ([key isEqual:@"uid"]) {
                self.uid=[dic valueForKey:key];
            }else if([key isEqual:@"logid"]){
                self.logid=[dic valueForKey:key];
            }else if([key isEqual:@"channel"]){
                self.channel=[dic valueForKey:key];
            }else if([key isEqual:@"model"]){
                self.model=[dic valueForKey:key];
            }else if ([key isEqual:@"position"]){
                self.position=[dic valueForKey:key];
            }else if ([key isEqual:@"src"]){
                self.src=[dic valueForKey:key];
            }else if ([key isEqual:@"url"]){
                self.url=[dic valueForKey:key];
            }else if ([key isEqual:@"size"]){
                self.size=[dic valueForKey:key];
            }else if ([key isEqual:@"fileName"]){
                self.fileName=[dic valueForKey:key];
            }else if ([key isEqual:@"packageName"]){
                self.packageName=[dic valueForKey:key];
            }else if ([key isEqual:@"second"]){
                self.second=[dic valueForKey:key];
            }else if ([key isEqual:@"nextSrc"]){
                self.next_src=[dic valueForKey:key];
            }else if([key isEqual:@"adName"]){
                self.adName=[dic valueForKey:key];
            }else if([key isEqual:@"updateTime"]){
                
            }else if ([key isEqual:@"updateText"]){
                
            }else if([key isEqual:@"updateUrl"]){
                self.update_url=[dic valueForKey:key];
            }
        }
    }
    return self;
}

@end