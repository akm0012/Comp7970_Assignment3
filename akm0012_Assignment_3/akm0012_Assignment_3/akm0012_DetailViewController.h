//
//  akm0012_DetailViewController.h
//  akm0012_Assignment_3
//
//  Created by Andrew Marshall on 7/14/14.
//  Copyright (c) 2014 Comp_7970_akm0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface akm0012_DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *detailText;

@property (strong, nonatomic) id detailItem;

- (IBAction)detailTextChanged:(UITextField *)sender;

@end
