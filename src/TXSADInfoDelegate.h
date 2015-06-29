//
//  TXSADInfoDelegate.h
//  TXPlaySDKForIOS
//
//  Created by xingQian on 15/6/12.
//  Copyright (c) 2015年 xingQian. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TXSADInfoDelegate : NSObject<NSXMLParserDelegate>

-(BOOL)parser:(NSData*)xmldata;

@end
