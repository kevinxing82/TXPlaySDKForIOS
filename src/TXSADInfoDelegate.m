//
//  TXSADInfoDelegate.m
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/12.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import "TXSADInfoDelegate.h"
#import "TXPlaySDKManager.h"

@implementation TXSADInfoDelegate

-(BOOL)parser:(NSData *)xmldata
{
    NSXMLParser *parser=[[NSXMLParser alloc] initWithData:xmldata];
    [parser setDelegate:self];
    return [parser parse];
}
//step1 准备解析
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}
//step2  准备解析节点
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //NSLog(@"%@",NSStringFromSelector(_cmd));
    if ([elementName  isEqual: @"ad"])
    {
        [TXPlaySDKMgr setData:[[TXSADInfo alloc] initWithDic:attributeDict]];
        //        for (NSString* key in attributeDict) {
        //            NSLog(@"key:%@ valueL:%@",key,[attributeDict objectForKey:key]);
        //        }
    }
}
//step3 获取首尾节点间内容
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}
//step4  解析完当前节点
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}
//step5  解析结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    //    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end