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

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Kick off the show
//    MainViewController *mainViewController = [[MainViewController alloc] init];
//    self.window.rootViewController = mainViewController;

    //Status Bar White
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    //init the view controllers for the tabs, Home and settings
    
    //Feed controller
    FeedViewController *feedVC = [[FeedViewController alloc]init];
    feedVC.tabBarItem.title = @"News Feed";
    feedVC.tabBarItem.image = [UIImage imageNamed:@"tabFeed"];
    UINavigationController *navFeedVC = [[UINavigationController alloc] initWithRootViewController:feedVC];

    //Requests controller
    RequestsViewController *requestsVC = [[RequestsViewController alloc]init];
    requestsVC.tabBarItem.title = @"Requests";
    requestsVC.tabBarItem.image = [UIImage imageNamed:@"tabRequests"];
    UINavigationController *navRequestsVC = [[UINavigationController alloc] initWithRootViewController:requestsVC];

    //Messages controller
    MessagesViewController *messagesVC = [[MessagesViewController alloc]init];
    messagesVC.tabBarItem.title = @"Messages";
    messagesVC.tabBarItem.image = [UIImage imageNamed:@"tabMessages"];
    
    UINavigationController *navMessagesVC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
   
    
    //Notifications controller
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc]init];
    notificationsVC.tabBarItem.title = @"Notifications";
    notificationsVC.tabBarItem.image = [UIImage imageNamed:@"tabNotifications"];
    UINavigationController *navNotifcationsVC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    
    //Settings controller
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    moreVC.tabBarItem.title = @"More";
    moreVC.tabBarItem.image = [UIImage imageNamed:@"tabMore"];
    UINavigationController *navMoreVC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    
    //Add the tab bar controller to the login window and kick off the show
    MainViewController *mainVC = [[MainViewController alloc]init];
    [self.window setRootViewController:mainVC];
    
    // Create View Controller
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, nil]];
    
    //color
    [self.tabBarController.tabBar setTintColor:UIColorFromRGB(0x405e9c)];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x405e9c)];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    
    //init the UITabBarController
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[navFeedVC,navRequestsVC,navMessagesVC,navNotifcationsVC,navMoreVC];

    
    //self.tabBarController.viewControllers = @[navVC];
    
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
