//
//  akm0012_DetailViewController.m
//  akm0012_Assignment_3
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
        self.detailText.text = [self.detailItem objectForKey:@"text"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    // This will cause the label to be updated with the correct text
    self.detailText.text = [self.detailItem objectForKey:@"text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)detailTextChanged:(UITextField *)sender {
    [self.detailItem setObject:sender.text forKey:@"text"];
}
@end
