//
//  DPDownLoadManger.m
//  DreamPlayer
//
//  Created by gajah on 14-9-23.
//  Copyright (c) 2014年 czl. All rights reserved.
//

#import "DPDownLoadManger.h"

@implementation DPDownLoadManger
+ (void)getWebsiteSource:(NSURL *)url block:(NetHandler)block
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __weak ASIHTTPRequest *weakRequest = request;
    [request setCompletionBlock:^{
        NSData *strData = [NSJSONSerialization JSONObjectWithData:weakRequest.responseData options:NSJSONReadingMutableContainers error:nil];
        block(YES,[[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding]);
    }];
    [request setFailedBlock:^{
        if (block) {
            block(NO,nil);
        }
    }];
    [request startAsynchronous];
}
@end
