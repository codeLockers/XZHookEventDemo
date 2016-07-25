//
//  XZHookObject.m
//  XZHookEventDemo
//
//  Created by 徐章 on 16/7/25.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZHookObject.h"
#import <UIKit/UIKit.h>
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation XZHookObject

+ (void)initialize{

    // 获取到UIWindow中sendEvent对应的method
        Method sendEvent = class_getInstanceMethod([UIWindow class], @selector(sendEvent:));
        Method sendEventMySelf = class_getInstanceMethod([self class], @selector(sendEventHooked:));
    
        // 将目标函数的原实现绑定到sendEventOriginalImplemention方法上
        IMP sendEventImp = method_getImplementation(sendEvent);
       class_addMethod([UIWindow class], @selector(sendEventOriginal:), sendEventImp,method_getTypeEncoding(sendEvent));

        // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP sendEventMySelfImp = method_getImplementation(sendEventMySelf);
      class_replaceMethod([UIWindow class], @selector(sendEvent:), sendEventMySelfImp, method_getTypeEncoding(sendEvent));
}

/*
   32  * 截获到window的sendEvent
   33  * 我们可以先处理完以后，再继续调用正常处理流程
   34  */
 - (void)sendEventHooked:(UIEvent *)event
{
        // do something what ever you want
        NSLog(@"haha, this is my self sendEventMethod!!!!!!!");

       // invoke original implemention
        [self performSelector:@selector(sendEventOriginal:) withObject:event];
    }

@end
