//
//  ShowTeamsViewController.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowTeamsViewController : UITableViewController {
    NSArray *teams;
}

@property (nonatomic, strong) NSArray *teams;

- (void) teamsPicked;

@end
