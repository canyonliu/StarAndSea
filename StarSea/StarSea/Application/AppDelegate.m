//
//  AppDelegate.m
//  StarSea
//
//  Created by WayneLiu on 15/4/14.
//  Copyright (c) 2015年 WayneLiu. All rights reserved.
//

#import "AppDelegate.h"
#import <SMS_SDK/SMS_SDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:130/255.f green:184/255.f blue:185/255.f alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:65/255.f green:184/255.f blue:231/255.f alpha:1.0]];
    //设置半透明属性
//    [[UINavigationBar appearance] setTranslucent:NO];
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    //    //*********//
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //
    //    self.window.backgroundColor = [UIColor whiteColor];
    //
    //    navigationVC = [[UINavigationController alloc] initWithRootViewController:self];
    //
    //    self.window.rootViewController = navigationVC;
    //
    //    //[self.window makeKeyAndVisible];
    //
    //    //*********//
    //    
    //    

    /**
     *  @author LQC
     *
     *  设置短信的APPkey和APPsecret
     */
    [SMS_SDK registerApp:APPKey withSecret:APPSecret];
    
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
