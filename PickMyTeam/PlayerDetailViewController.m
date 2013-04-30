//
//  PlayerDetailViewController.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerDetailViewController.h"
#import "Player.h"
#import "StatCell.h"
#import "NameCell.h"

@interface PlayerDetailViewController ()

@end

@implementation PlayerDetailViewController

@synthesize player;
@synthesize canEdit;

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
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    if (canEdit)
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = self.player.name;
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

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return @"Personal";
    else if (section == 1)
        return @"Stats";
    return nil;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0)
        return 1;
    if (section == 1)
        return 3;
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        NameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell"];
        cell.nameField.text = self.player.name;
        return cell;
    } else if (indexPath.section == 1){
        StatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatCell"];
        cell.statName.text = [self.player.statNames objectAtIndex:indexPath.row];
        cell.stat = [self.player.stats objectAtIndex:indexPath.row];
        return cell;
    }
    return nil;
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    if (editing == YES) {
        [self.navigationItem setHidesBackButton:YES animated:YES];
        [self.navigationItem setRightBarButtonItem: [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)] animated:YES];
    } else {
        [self.navigationItem setHidesBackButton:NO animated:YES];
        [self.navigationItem setRightBarButtonItem:self.editButtonItem animated:YES];
    }
}

- (void) done:(id)sender {
    NameCell *cell = (NameCell *) [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    player.name = cell.nameField.text;
    self.title = self.player.name;    
    [self setEditing:NO animated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

@end
