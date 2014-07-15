//  Author: Andrew K. Marshall
//  Last Revision: 7/14/14
//  COMP 7970: Assignment 3
//
//  akm0012_DetailViewController.m
//
//  Created by Andrew Marshall on 7/14/14.
//  Copyright (c) 2014 Comp_7970_akm0012. All rights reserved.
//

#import "akm0012_DetailViewController.h"

@interface akm0012_DetailViewController ()
- (void)configureView;
@end

@implementation akm0012_DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.comic_title.text = [self.detailItem objectForKey:@"comic_title"];
        self.comic_issue_num.text = [self.detailItem objectForKey:@"comic_issue_num"];
        self.comic_writer.text = [self.detailItem objectForKey:@"comic_writer"];
        self.comic_illustrator.text = [self.detailItem objectForKey:@"comic_illustrator"];
        self.comic_inker.text = [self.detailItem objectForKey:@"comic_inker"];
        self.comic_publisher.text = [self.detailItem objectForKey:@"comic_publisher"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    // This will cause the label to be updated with the correct text
    self.comic_title.text = [self.detailItem objectForKey:@"comic_title"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This is called whenever the user is done editing a comic book's details
// I used tags to identify what text field has been edited
- (IBAction)comic_details_changed:(UITextField *)sender {
    
    switch (sender.tag) {
        case 1:
            [self.detailItem setObject:sender.text forKey:@"comic_title"];
            break;
            
        case 2:
            [self.detailItem setObject:sender.text forKey:@"comic_issue_num"];
            break;
            
        case 3:
            [self.detailItem setObject:sender.text forKey:@"comic_writer"];
            break;
            
        case 4:
            [self.detailItem setObject:sender.text forKey:@"comic_illustrator"];
            break;
            
        case 5:
            [self.detailItem setObject:sender.text forKey:@"comic_inker"];
            break;
            
        case 6:
            [self.detailItem setObject:sender.text forKey:@"comic_publisher"];
            break;
            
        default:
            break;
    }
    
}

// This will make any keyboard disapear when you tap the background.
- (IBAction)backgroundTap:(id)sender {
    [self.comic_title resignFirstResponder];
    [self.comic_issue_num resignFirstResponder];
    [self.comic_writer resignFirstResponder];
    [self.comic_illustrator resignFirstResponder];
    [self.comic_inker resignFirstResponder];
    [self.comic_publisher resignFirstResponder];

    
}
@end
