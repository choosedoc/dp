//
//  Const.h
//  DreamPlayer
//
//  Created by gajah on 14-9-23.
//  Copyright (c) 2014年 czl. All rights reserved.
//

#ifndef DreamPlayer_Const_h
#define DreamPlayer_Const_h
// 适配
#define GF(ctl) NSLog(@"frame = %@",NSStringFromCGRect(ctl.frame));
#define AUTORESIZECODE UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth
#define CONTENTMODECODE UIViewContentModeScaleAspectFit
#define viewWidth self.view.frame.size.width
#define viewHeight self.view.frame.size.height
#define IS_IPADMINI (IS_IPADALL && (!IS_IPADBIG))
#define IS_IPADBIG (([[UIScreen mainScreen] bounds].size.width-1536) >= 0 ?YES:NO)
#define IS_IPADALL (([[UIScreen mainScreen] bounds].size.width-768) >= 0 ?YES:NO)
#define IS_IPHONE6 (IS_IPHONE6ORPLUS && (!IS_IPHONE6PLUS))
#define IS_IPHONE6PLUS  (([[UIScreen mainScreen] bounds].size.width-540) >= 0 ?YES:NO)
#define IS_IPHONE6ORPLUS (([[UIScreen mainScreen] bounds].size.width-375) >= 0 &&  ([[UIScreen mainScreen] bounds].size.width < 768) ?YES:NO)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPHONE4  (int)([UIScreen mainScreen].bounds.size.height)
#define IS_I4 (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define IPAD_DETAILW ((IS_IPADBIG) ? 4.8 : 2.4)
#define IPHONE_DETAILW ((IS_IPHONE6PLUS)  ? 1.7 : 1.2)
#define IPAD_DETAILH ((IS_IPADBIG) ? 3.6 : 1.8)
#define IPHONE_DETAILH IPHONE_DETAILW
#define BW (IS_IPADALL ? IPAD_DETAILW : (IS_IPHONE6ORPLUS ? IPHONE_DETAILW : 1))
#define BH  (IS_IPADALL ? IPAD_DETAILH : (IS_IPHONE6ORPLUS ? IPHONE_DETAILH : 1))


#define kLoc(str) NSLocalizedString(str, nil)
// 颜色效果
#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]
#define COLOR_HALFBLACKMASK RGBA(60.f, 60.f, 60.f, 0.5f)
#endif
