//  Author: Andrew K. Marshall
//  Last Revision: 7/14/14
//  COMP 7970: Assignment 3
//
//  akm0012_DetailViewController.h
//
//  Created by Andrew Marshall on 7/14/14.
//  Copyright (c) 2014 Comp_7970_akm0012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface akm0012_DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *comic_title;
@property (weak, nonatomic) IBOutlet UITextField *comic_issue_num;
@property (weak, nonatomic) IBOutlet UITextField *comic_writer;
@property (weak, nonatomic) IBOutlet UITextField *comic_illustrator;
@property (weak, nonatomic) IBOutlet UITextField *comic_inker;
@property (weak, nonatomic) IBOutlet UITextField *comic_publisher;

@property (strong, nonatomic) id detailItem;

- (IBAction)comic_details_changed:(UITextField *)sender;

@end
