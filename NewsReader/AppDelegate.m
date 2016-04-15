//
//  AppDelegate.m
//  NewsReader
//
//  Created by Mac on 12/03/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsReader-Swift.h"
@import UIKit;
@import FBSDKCoreKit;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    [self askForPushPermission:application];
    
    NSLog(@"%@", launchOptions);
    
    NSDictionary* push = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if( push != nil ){
        NSString* message = push[@"aps"][@"alert"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAlert:message];
        });
    }
    
    return YES;
}

- (void)showAlert:(NSString*)message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Notification" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:okAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo{
    NSLog(@"%@",userInfo);
    
    NSString* mess = userInfo[@"aps"][@"alert"];
    
    [self showAlert:mess];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString* token = [deviceToken description];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    [PushComm addToken:token];
    
    NSLog(@"%@", token);
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError*) error{
    NSLog(@"%@", error);
}

- (void)application:(UIApplication*) application didRegisterUserNotificationSettings:(nonnull UIUserNotificationSettings *)notificationSettings{
    if( notificationSettings.types != UIUserNotificationTypeNone ){
        [application registerForRemoteNotifications];
    }
}

- (void) askForPushPermission:(UIApplication*) application{
    UIUserNotificationSettings* notifSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
    
    [application registerUserNotificationSettings:notifSettings];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
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
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
