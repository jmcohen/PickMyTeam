//
//  ChoosePlayersViewController.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosePlayersViewController : UITableViewController {
    NSArray *allPlayers;
    NSMutableArray *selectedPlayers;
}

@property (nonatomic, strong) NSArray *allPlayers;
@property (nonatomic, strong) NSMutableArray *selectedPlayers;

@end
