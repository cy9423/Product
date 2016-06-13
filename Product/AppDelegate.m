//
//  AppDelegate.m
//  Product
//
//  Created by cy on 16/4/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "MainNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    
    //创建试图控制器对象
    MainTabBarController *mc = [[MainTabBarController alloc] init];
    MainNavigationController *mnc = [[MainNavigationController alloc] initWithRootViewController:mc];
    [self pushWith:application];
    //设置窗口的背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置窗口的根视图控制器
    self.window.rootViewController = mnc;
    
    //设置让窗口显示
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)pushWith:(UIApplication *)application
{
    //无论本地推送还是远处推送 均需询问用户是否开启推送功能
    //版本适配
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        //采用新方法
        //1.推送设置
        /*
         1.推送的类型（文字、声音、标识）
         2.额外操作（额外按钮）
         */
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        
        //2.程序接收设置
        [application registerUserNotificationSettings:settings];
        
        //3.开启并询问
        [application registerForRemoteNotifications];
    }else
    {
        [application registerForRemoteNotificationTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound];
        
        [application registerForRemoteNotifications];
    }

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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK
    if ([url.host isEqualToString:@"safepay"]){
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}

#pragma mark - 用于接收本地消息
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"接收");
    
    NSString *url = [NSString stringWithFormat:@"是否打开来自%@的消息",notification.userInfo[@"URL"]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:url delegate:self cancelButtonTitle:@"前往播放" otherButtonTitles:@"拒绝", nil];
    
    [alert show];
    
    
    
}
@end
