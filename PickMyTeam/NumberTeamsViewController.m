//
//  NumberTeamsViewController.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberTeamsViewController.h"
#import "SharedSolver.h"

@interface NumberTeamsViewController ()

@end

@implementation NumberTeamsViewController

@synthesize numTeamsLabel, numTeamsStepper;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    numTeams = 2;
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)stepperChanged:(id)sender {
    numTeams = [NSNumber numberWithDouble: numTeamsStepper.value].intValue;
    numTeamsLabel.text = [NSString stringWithFormat:@"%d", numTeams];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NextPressed"]){
        SharedSolver *solver = [SharedSolver sharedSolver];
        solver.numberOfTeams = numTeams;
    }
}

@end
