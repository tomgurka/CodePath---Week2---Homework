//
//  AppDelegate.m
//  Week2
//
//  Created by Tom Gurka on 6/10/14.
//  Copyright (c) 2014 tom. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"
#import "FeedViewController.h"
#import "MoreViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Kick off the show
//    MainViewController *mainViewController = [[MainViewController alloc] init];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = mainViewController;

    //Status Bar White
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //init the view controllers for the tabs, Home and settings
    
    //Feed controller
    FeedViewController *feedVC = [[FeedViewController alloc]init];
    feedVC.tabBarItem.title = @"News Feed";
    feedVC.tabBarItem.image = [UIImage imageNamed:@"tabFeed"];
    
    //Requests controller
    RequestsViewController *requestsVC = [[RequestsViewController alloc]init];
    requestsVC.tabBarItem.title = @"Requests";
    
    //Messages controller
    MessagesViewController *messagesVC = [[MessagesViewController alloc]init];
    messagesVC.tabBarItem.title = @"Messages";
    
    //Notifications controller
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc]init];
    notificationsVC.tabBarItem.title = @"Notifications";
    
    //Settings controller
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    moreVC.tabBarItem.title = @"More";
    
    //init the UITabBarController
    
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[feedVC,requestsVC,messagesVC,notificationsVC,moreVC];
    
    //Add the tab bar controller to the window
    MainViewController *mainVC = [[MainViewController alloc]init];
    [self.window setRootViewController:mainVC];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
