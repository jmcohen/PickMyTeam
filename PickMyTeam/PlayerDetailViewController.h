//
//  PlayerDetailViewController.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Player;
@class StatCell;

@interface PlayerDetailViewController : UITableViewController<UITextFieldDelegate> {
    Player *player;
    BOOL canEdit;
}

@property (nonatomic, strong) Player *player;
@property (nonatomic) BOOL canEdit;

- (void) done: (id) sender;

@end
