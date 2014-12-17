//
//  AppDelegate.m
//  ARSSReader
//
//  Created by Marin Todorov on 29/10/2012.
//

#import "AppDelegate.h"
#import "Map.h"
#import "MapsViewController.h"
#import "GAI.h"

@implementation AppDelegate

{
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:@"AIzaSyBoRhmOlcjcrMkaYGLPGuiCYLh481gEYp0"];
    
    /*
     if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
     
     // Load resources for iOS 6.1 or earlier
     //[[UINavigationBar appearance]setTintColor:[UIColor purpleColor]];
     } else {
     */
     [[UINavigationBar appearance] setBarTintColor: [UIColor whiteColor]];
     
     UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
     //UINavigationController *navigationController = [tabBarController viewControllers][1];
     
     //UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
     UITabBar *tabBar = tabBarController.tabBar;
     UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
     UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
     UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
     UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
     //UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
     
     UIImage *image = [UIImage imageNamed:@"810-document-2.png"];
     image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     UIImage *image2 = [UIImage imageNamed:@"852-map.png"];
     image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     UIImage *image3 = [UIImage imageNamed:@"851-calendar.png"];
     image3 = [image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image4 = [UIImage imageNamed:@"777-thumbs-up.png"];
     image4 = [image4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
     //UIImage *image5 = [UIImage imageNamed:@"777-thumbs-up.png"];
     //image5 = [image5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     //tabBarItem1.selectedImage= [UIImage imageNamed:@"753-signpost-
     tabBarItem1.image = image; //[UIImage imageNamed:@"753-signpost.png"];
     tabBarItem1.selectedImage= [UIImage imageNamed:@"810-document-2-selected.png"];
     tabBarItem2.image = image2;
     tabBarItem2.selectedImage = [UIImage imageNamed:@"852-map-selected.png"];
    
     tabBarItem3.image = image3;
     tabBarItem3.selectedImage = [UIImage imageNamed:@"851-calendar-selected.png"];
    
     tabBarItem4.image = image4;
     tabBarItem4.selectedImage = [UIImage imageNamed:@"777-thumbs-up-selected.png"];
    
     
     // sets color of text on tab bar itmes to white rather than tinted....
     [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName :
     [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
     NSForegroundColorAttributeName : [UIColor whiteColor]
     } forState:UIControlStateNormal];
     // [[UINavigationBar appearance] setTitleTextAttributes:
     // [NSDictionary dictionaryWithObjectsAndKeys:
     //  [UIColor blackColor], NSForegroundColorAttributeName,
     //  [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil]];
     
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent ];
     [[UIApplication sharedApplication] setStatusBarHidden:YES];
     
     // set heading text
     [[UINavigationBar appearance]setTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
     
     //tabBar..color = [UIColor whiteColor];
     // set text of tab text to while
     [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
     
     // set bottom tab bar to our color
     //[[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:127.0f/255.0f green:8.0f/255.0f blue:8.0f/255.0f alpha:1.0] ];
     [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:158.0f/255.0f green:51.0f/255.0f blue:69.0f/255.0f alpha:1.0] ];
    
    
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-57261659-1"];

    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Google Analytics" message:@"With your permission usage information will be collected to improve the application." delegate:self cancelButtonTitle:@"Opt Out" otherButtonTitles:@"Opt In", nil];
    [av show];
    
   
    
    // change navbar to desired color
    // [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:1/255.0 alpha:1 ]];
     
//}
    // */
    
    //int logval = [_maps count];
    //NSLog(@"this if fun %i", logval);
    //[UIColor colorWithRed:255/255.0f green:248/255.0f blue:179/255.0f alpha:1.0f];
    
    //[[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:255/255.0f green:244/255.0f blue:117/255.0f alpha:1.0f]];
    
    
    //NSString  *cat = navigationController.title;
    //NSLog(@"the name is %@",cat);
    //MapsViewController *mapsViewController =  [navigationController viewControllers][0];
    // NSLog(mapsViewController.title);
    //mapsViewController.MyMaparray = _maps;
    //MUST set class to UITableView class to MapsViewController
    // that was your problem man.
    // Override point for customization after application launch.
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [[GAI sharedInstance] setOptOut:YES];
            break;
        case 1:
            [[GAI sharedInstance] setOptOut:NO];
            break;
            
        default:
            break;
    }
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
