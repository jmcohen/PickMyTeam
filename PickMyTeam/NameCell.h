//
//  EditNameCell.h
//  PickMyTeam
//
//  Created by Jeremy Cohen on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameCell : UITableViewCell {    
    UITextField *nameField;
}

@property (nonatomic, strong) IBOutlet UITextField *nameField;

@end
