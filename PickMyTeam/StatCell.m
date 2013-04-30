//
//  StatCell.m
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StatCell.h"
#import "Stat.h"

@implementation StatCell

@synthesize stat, valueLabel, valueStepper, statName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setValue:(NSInteger)newValue {
    self.stat.value = newValue;
    valueLabel.text = [NSString stringWithFormat:@"%d", newValue];
    valueStepper.value = newValue;
}

- (void) setStat:(Stat *)newStat {
    stat = newStat;
    [self setValue:stat.value];;
}

- (IBAction)statValueChanged:(id)sender{
    [self setValue: valueStepper.value];
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [UIView beginAnimations:@"Animation" context:NULL];
    [UIView setAnimationDuration:.5];
    if (editing == YES){
        valueStepper.alpha = 1;
        valueStepper.enabled = YES;
    } else {
        valueStepper.alpha = 0;
        valueStepper.enabled = NO;
    }
    [UIView commitAnimations];
}

@end
