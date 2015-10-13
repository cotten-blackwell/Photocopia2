//
//  AppDelegate.m
//  Photocopia
//
//  Created by Cotten Blackwell on 9/30/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotosViewController.h"
#import "Animator.h"

#import <SimpleAuth/SimpleAuth.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SimpleAuth.configuration[@"instagram"] = @{
       @"client_id" : @"e7e50ff7b4dc4be19a22500b85100c69",
       SimpleAuthRedirectURIKey : @"http://www.royallymore.com"
       };
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    PhotosViewController *photosViewController = [[PhotosViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    
    UINavigationBar *navigationBar = navigationController.navigationBar;
    navigationBar.barTintColor = [UIColor colorWithRed:232.0 / 255.0 green:129.0 / 255.0 blue:91.0 / 255.0 alpha:1.0];
    navigationBar.barStyle = UIBarStyleBlackOpaque;
    navigationBar.tintColor = [UIColor whiteColor];
    
    self.window.rootViewController = navigationController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end