//
//  MethodForward.m
//  CodeStudy
//
//  Created by NingXia on 2023/7/17.
//

#import "MethodForward.h"
#import <objc/runtime.h>

//自定义消息转发主要通过实现以下方法:
//- **resolveInstanceMethod**: 动态添加方法实现
//- **forwardingTargetForSelector**: 转发给其他对象
//- **methodSignatureForSelector**: 获取方法签名
//- **forwardInvocation**: 将调用转发给其他对象

@implementation MethodForward

- (void)testMethod {
    NSLog(@"Call testMethod");
}

//- (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(testMethod)) {
//        class_addMethod([self class], sel, (IMP)testMethod, "v@:");
//        return YES;
//    }
//
//    return [NSObject resolveInstanceMethod:sel];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *selName = NSStringFromSelector(aSelector);
    if ([selName hasPrefix:@"customMethod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSString *selName = NSStringFromSelector(anInvocation.selector);
    
    if ([selName hasPrefix:@"customMethod"]) {
        NSLog(@"CustomObject: %@", selName);
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end
