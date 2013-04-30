//
//  StatCell.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Stat;

@interface StatCell : UITableViewCell {
    Stat *value;
    
    UILabel *statName;
    UIStepper *valueStepper;
    UILabel *valueLabel;
}

@property (nonatomic) Stat *stat;
@property (nonatomic, strong) IBOutlet UILabel *statName;
@property (nonatomic, strong) IBOutlet UIStepper *valueStepper;
@property (nonatomic, strong) IBOutlet UILabel *valueLabel;

- (IBAction)statValueChanged:(id)sender;

@end
