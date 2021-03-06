//
//  AppDelegate.m
//  OC2.0 Effective
//
//  Created by zhangke on 15/4/27.
//  Copyright (c) 2015年 zhangke. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BlockViewController.h"
#import "GCDObject.h"
#import "DesignPatterns.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    id ooo=nil;
//    @autoreleasepool {
        ooo=[NSObject alloc];
        [ooo retain];
        [ooo autorelease];
        [ooo autorelease];

//    }
    
    NSString* aimianliang=@"111222";
    NSString* newstring=[aimianliang retain];
    //全局数据区域的，特么的没有retainCount
    

    
    //autorelease 不立马－1, pool drain才－1， 每个函数的pool都是由runloop开辟的
    
    
    //返回值类型，声明函数名，参数别表，    ^ 返回值类型，参数列表
    UIImage* (^downloadImage)(NSURL* url)=^ UIImage* (NSURL* url){
        return [UIImage new];
    };
    UIImage* image=  downloadImage(nil);
    
    
    
    
    NSData* (^loadData)(NSNumber* num) = ^ NSData* (NSNumber* num){
        return [NSData new];
    };
    
    NSData* data= loadData(@1);
    
    
    ViewController* vcxx=[[ViewController alloc] initWithName:@"zhangke"];
    //[vcxx url]
    [vcxx down:^(UIImage* image){
        NSLog(@"xx");
    }];
    
    //有用来描述类和元类的作用
    Class xx= objc_getMetaClass(class_getName(vcxx.class));
    
    unsigned int outCount=0;
    Method *methods = class_copyMethodList(vcxx.class, &outCount);
    Method method=methods[0];
    SEL sel=  method_getName(method);
    
    
//#if 0
  
    NSString* s=Notification;
    
    ViewController* vc=[[ViewController alloc] initWithName:@"zhangke"];
    //vc.name=@"ke";
    //[vc copy];
    
    //public
    //vc->_test=@"22";
    
    [vc memory];
    //循环引用
    //[vc release];
    
    [vc CoreFoundation];
    
    [vc aftermemory];
    
    
    BlockViewController* blockVC=[[BlockViewController alloc] init];
    [blockVC viewDidLoad];
    [blockVC release];
    
    
    [[GCDObject alloc] init];
    
    DesignPatterns* design=[[DesignPatterns alloc] init];

    
//#endif

 
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    //应用关闭时，需要close和释放资源
    
}

@end
