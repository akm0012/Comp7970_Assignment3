//  Author: Andrew K. Marshall
//  Last Revision: 7/14/14
//  COMP 7970: Assignment 3
//
//  akm0012_MasterViewController.m
//
//  Created by Andrew Marshall on 7/14/14.
//  Copyright (c) 2014 Comp_7970_akm0012. All rights reserved.
//

#import "akm0012_MasterViewController.h"

#import "akm0012_DetailViewController.h"

@interface akm0012_MasterViewController () {
    
//    __weak IBOutlet UILabel *issue_num_label;
    NSMutableArray *_comic_book_list;
}
@end

@implementation akm0012_MasterViewController

// This will make the data propigate back
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UITableView *view = (UITableView *)self.view;
    [view reloadData];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // This is where we add the delete button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // This will set the edit button's text to "Delete"
    self.editButtonItem.title = @"Delete";

    // This is where the add button gets "added"
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:newBackButton];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This is the code that runs when you push the add button
- (void)insertNewObject:(id)sender
{
    // If the list does not exsist, make one
    if (!_comic_book_list) {
        _comic_book_list = [[NSMutableArray alloc] init];
    }
    
    NSMutableDictionary *my_comic = [[NSMutableDictionary alloc] init];
    [my_comic setObject:@"New Comic" forKey:@"comic_title"];
    
    [_comic_book_list insertObject:my_comic atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // This will make it automatically go to the edit screen when you press the add button
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _comic_book_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSMutableDictionary *my_comic_object = _comic_book_list[indexPath.row];
    cell.textLabel.text = [my_comic_object objectForKey:@"comic_title"];
    cell.detailTextLabel.text = [my_comic_object objectForKey:@"comic_issue_num"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_comic_book_list removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableDictionary *object = _comic_book_list[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

// This is used to make sure the edit button's text stays to "Delete" and "Cancel"
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    // Make sure you call super first
    [super setEditing:editing animated:animated];
    
    if (editing)
    {
        self.editButtonItem.title = NSLocalizedString(@"Done", @"Done");
    }
    else
    {
        self.editButtonItem.title = NSLocalizedString(@"Delete", @"Delete");
    }
}



@end




















