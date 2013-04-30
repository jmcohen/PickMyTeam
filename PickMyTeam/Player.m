//
//  Player.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "Stat.h"

@implementation Player

@synthesize name, statNames, stats;

- (id) init {
    if (self = [super init]){
        statNames = [NSArray arrayWithObjects:@"Offense", @"Defense", @"Running", nil];
        stats = [NSArray arrayWithObjects: [[Stat alloc] init], [[Stat alloc] init], [[Stat alloc] init], nil];
    }
    return self;
}

- (id) initWithName:(NSString *)theName offense:(NSInteger)theOffense defense:(NSInteger)theDefense running:(NSInteger)theRunning {
    if (self = [self init]){
        name = theName;
        ((Stat *) [stats objectAtIndex:0]).value = theOffense;
        ((Stat *) [stats objectAtIndex:1]).value = theDefense;
        ((Stat *) [stats objectAtIndex:2]).value = theRunning;
    }
    return self;
}

- (id) initWithDictionary: (NSDictionary *) dictionary{
    if (self = [self init]){
        name = [dictionary objectForKey:@"name"];
        NSArray *statValues = [dictionary objectForKey:@"statValues"];
        for (int i = 0; i < statValues.count; i++){
            NSInteger value = ((NSNumber *) [statValues objectAtIndex:i]).integerValue;
            ((Stat *)[self.stats objectAtIndex:i]).value = value;
        }
    }
    return self;
}

- (id) toDictionary {
    NSMutableArray *statValues = [NSMutableArray array];
    for (Stat *stat in self.stats)
        [statValues addObject: [NSNumber numberWithInt: stat.value]];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.name forKey:@"name"];
    [dict setValue:statValues forKey:@"statValues"];
    return dict;
}

@end
