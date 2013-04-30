//
//  Player.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Player : NSObject {
    NSString *name;
    NSArray *statNames;
    NSArray *stats;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *statNames;
@property (nonatomic, strong) NSArray *stats;


- (id) init;
- (id) initWithName: (NSString *) theName offense: (NSInteger) theOffense defense: (NSInteger) theDefense running: (NSInteger) theRunning;
- (id) initWithDictionary: (NSDictionary *) dictionary;
- (NSDictionary *) toDictionary;

@end
