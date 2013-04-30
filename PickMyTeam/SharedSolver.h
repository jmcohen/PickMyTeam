//
//  SharedGameManager.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharedSolver : NSObject {
    NSInteger numberOfTeams;
    NSArray *_players;
    NSArray *_teams;
}

@property (nonatomic) NSInteger numberOfTeams;
@property (nonatomic, strong) NSArray *players;
@property (nonatomic, strong) NSArray *teams;

+ (SharedSolver *) sharedSolver;
- (void) pickTeams;

// Private methods
- (void) computeTeams;
- (void) notifyCompletion;

NSArray *bestTeams(NSArray *players, int numTeams);
NSArray *makeTeams(NSArray *players, int numTeams);
float deviationBetweenTeams(NSArray* teams );
int totalStat(NSArray *team, int statIndex);
NSArray *shuffledArray(NSArray *originalArray);


@end