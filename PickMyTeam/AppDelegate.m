//
//  AppDelegate.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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

+ (NSString *) pathWithFilename: (NSString *) filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [NSString stringWithFormat: @"%@/%@", documentsDirectory, filename];
    return path;
}


+ (void) savePlayers:(NSMutableArray *)players {
    NSMutableArray *playerDictionaries = [NSMutableArray array];
    for (Player *player in players)
        [playerDictionaries addObject:[player toDictionary]];
    [playerDictionaries writeToFile:[AppDelegate pathWithFilename:@"players.xml"] atomically:YES];
}

+ (NSMutableArray *) loadPlayers {
    NSArray *playerDictionaries = [NSArray arrayWithContentsOfFile:[AppDelegate pathWithFilename:@"players.xml"]];
    NSMutableArray *players = [NSMutableArray array];
    for (NSDictionary *playerDictionary in playerDictionaries){
        Player *player = [[Player alloc] initWithDictionary:playerDictionary];
        [players addObject:player];
    }
    return players;
}

@end
