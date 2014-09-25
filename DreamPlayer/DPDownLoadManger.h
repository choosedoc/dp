//
//  DPDownLoadManger.h
//  DreamPlayer
//
//  Created by gajah on 14-9-23.
//  Copyright (c) 2014年 czl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void ((^NetHandler)(BOOL isSucess,NSString *sourceCode));
/**
 *  @brief 网络事件处理类
 */
@interface DPDownLoadManger : NSObject
/**
 *  @brief 获取网站源码
 */
+ (void)getWebsiteSource:(NSURL *)url block:(NetHandler)block;
@end
