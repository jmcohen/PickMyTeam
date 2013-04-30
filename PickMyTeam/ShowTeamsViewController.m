//
//  ShowTeamsViewController.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShowTeamsViewController.h"
#import "SharedSolver.h"
#import "Player.h"
#import "PlayerDetailViewController.h"

@interface ShowTeamsViewController ()

@end

@implementation ShowTeamsViewController

@synthesize teams;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    SharedSolver *solver = [SharedSolver sharedSolver];
    [solver pickTeams];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamsPicked) name:@"TeamsPicked" object:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) teamsPicked{
    SharedSolver *solver = [SharedSolver sharedSolver];
    self.teams = solver.teams;
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.teams.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.teams objectAtIndex:section] count];
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Team %d", (section + 1)];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = [[self.teams objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = player.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ViewPlayer" sender:[[self.teams objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewPlayer"]){
        PlayerDetailViewController *detailController = segue.destinationViewController;
        detailController.player = sender;
        detailController.canEdit = NO;
    }
}

@end
