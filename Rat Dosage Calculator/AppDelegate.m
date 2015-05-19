//
//  AppDelegate.m
//  Rat Dosage Calculator
//
//  Created by Liana Chu on 1/28/15.
//  Copyright (c) 2015 Liana Chu. All rights reserved.
//

#import "AppDelegate.h"
#import "Baytril10LiquidViewController.h"
#import "Doxycycline100mgViewController.h"
#import "ModalDisclaimerViewController.h"
#import "AmoxiViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    self.window = window;
    
    Baytril10LiquidViewController *baytril10LiquidViewController = [[Baytril10LiquidViewController alloc] init];
    Doxycycline100mgViewController *doxycycline100mgViewController = [[Doxycycline100mgViewController alloc] init];
    AmoxiViewController *amoxiViewController = [[AmoxiViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[baytril10LiquidViewController, doxycycline100mgViewController, amoxiViewController];
    window.rootViewController = tabBarController;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"TermsAccepted"]!=YES)
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"TermsAccepted"];
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"TermsAccepted"]){
    }
    else{
        ModalDisclaimerViewController *modalVC = [[ModalDisclaimerViewController alloc] init];
        modalVC.modalPresentationStyle = UIModalPresentationFullScreen;
        modalVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [tabBarController presentViewController:modalVC animated:NO completion:nil];
    }
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
