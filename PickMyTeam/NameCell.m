//
//  EditNameCell.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

@synthesize nameField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    if (editing == YES){
        self.nameField.enabled = YES;
    } else {
        self.nameField.enabled = NO;
    }
}

@end
