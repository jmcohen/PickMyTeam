//
//  NumberTeamsViewController.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberTeamsViewController : UITableViewController {
    NSInteger numTeams;
    UIStepper *numTeamsStepper;
    UILabel *numTeamsLabel;
}

@property (nonatomic, strong) IBOutlet UIStepper *numTeamsStepper;
@property (nonatomic, strong) IBOutlet UILabel *numTeamsLabel;

- (IBAction)stepperChanged:(id)sender;

@end
