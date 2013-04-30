//
//  PlayersListViewController.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersListViewController : UITableViewController {
    NSMutableArray *players;
}

@property (nonatomic, strong) NSMutableArray *players;

@end
