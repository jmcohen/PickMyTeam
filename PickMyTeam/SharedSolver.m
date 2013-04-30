//
//  SharedGameManager.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SharedSolver.h"
#import "Player.h"
#import "Stat.h"

static SharedSolver *solver = nil;

@implementation SharedSolver

@synthesize numberOfTeams;
@synthesize players = _players;
@synthesize teams = _teams;

+ (SharedSolver *)sharedSolver {
    @synchronized(self){
        if (solver == nil)
            solver = [[SharedSolver allocWithZone:NULL] init];
    }
    return solver;
}

- (void) pickTeams {
    NSThread *computeThread = [[NSThread alloc] initWithTarget:self selector:@selector(computeTeams) object:nil];
    [computeThread start];
}

- (void) computeTeams {
    self.teams = bestTeams(self.players, self.numberOfTeams);
    [self performSelectorOnMainThread:@selector(notifyCompletion) withObject:nil waitUntilDone:YES];
    
}

- (void) notifyCompletion {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TeamsPicked" object:nil];
}

NSArray *bestTeams(NSArray *players, int numTeams){
    NSArray *bestTeams = nil;
    float lowestDeviation = FLT_MAX;
    
    int numIterations = 1000;
    
    for (int i = 0; i < numIterations; i++){
        NSArray *teams = makeTeams(players, numTeams);
        float dev = deviationBetweenTeams(teams);
        if (dev < lowestDeviation){
            lowestDeviation = dev;
            bestTeams = teams;
        }
    }
    return bestTeams;
}

NSArray *makeTeams(NSArray *players, int numTeams){
    NSArray *shuffledPlayers = shuffledArray(players);
    NSMutableArray *teams = [[NSMutableArray alloc] init];
    for (int i = 0; i < numTeams; i++)
        [teams addObject: [[NSMutableArray alloc] init]];
    for (int i = 0; i < players.count; i ++)
        [((NSMutableArray *)[teams objectAtIndex: (i % numTeams)]) addObject:[shuffledPlayers objectAtIndex:i]];
    return teams;
}

float deviationBetweenTeams(NSMutableArray *teams ) {
    int numStats = 3;
    float statSums[numStats];
    for (NSMutableArray *team in teams)
        for (int i = 0; i < numStats; i++)
            statSums[i] += totalStat(team, i);
    
    float statMeans[numStats];
    for (int i = 0; i < numStats; i++)
        statMeans[i] = statSums[i] / teams.count;
    
    float statDeviationSums[numStats];
    for (int i = 0; i < teams.count; i++)
        for (int j = 0; j < numStats; j++)
            statDeviationSums[j] = abs(totalStat([teams objectAtIndex:i], j) - statMeans[j]);
    
    float statDeviationMeans[numStats];
    for (int i = 0; i < numStats; i++)
        statDeviationMeans[i] = statDeviationSums[i] / teams.count;
    
    float total = 0; 
    for (int i = 0; i < numStats; i++)
        total += statDeviationMeans[i];
    
    return total;
}

int totalStat(NSMutableArray *team, int statIndex){
    int total = 0;
    for (Player *player in team){
        total += ((Stat *)[player.stats objectAtIndex:statIndex]).value;
    }
    return total;
}

NSArray *shuffledArray(NSArray *originalArray) {
    NSMutableArray *array = [NSMutableArray arrayWithArray:originalArray];
    for (int i = 0; i < array.count; i++){
        int r =  arc4random() % array.count;
        [array exchangeObjectAtIndex:i withObjectAtIndex:r];
    }
    return array;
}

@end
