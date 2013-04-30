//
//  AppDelegate.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (NSString *) pathWithFilename: (NSString *) filename;
+ (void) savePlayers: (NSMutableArray *)players;
+ (NSMutableArray *) loadPlayers;

@end
