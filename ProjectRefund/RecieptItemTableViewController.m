//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Stephen Meriwether on 5/28/14.
//  Copyright (c) 2014 Stephen Meriwether. All rights reserved.
//

#import "RecieptItemTableViewController.h"
#import "RecieptItem.h"
#import "RecieptItemStore.h"
#import "RecieptDetailViewController.h"

@interface RecieptItemTableViewController()

@property (nonatomic) NSIndexPath *indexToDelete;

@end

@implementation RecieptItemTableViewController

- (void)awakeFromNib
{
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[RecieptItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create an instance of UITabelCell with default appearance
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    NSArray *recieptItems = [[RecieptItemStore sharedStore] allItems];
    RecieptItem *item;
    
    if (indexPath.row != [[[RecieptItemStore sharedStore] allItems] count]) {
        item = recieptItems[indexPath.row];
        cell.textLabel.text = item.description;
    }
    else {
        cell.textLabel.text = @"No more items!";
    }
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (IBAction)addRow:(id)sender
{
    NSLog(@"In add row");
    
    // create a new object
    RecieptItem *newItem = [[RecieptItemStore sharedStore] createItem];
    
    // make a new index path for the 0th section, last row
    NSInteger lastRow = [[[RecieptItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow
                                                inSection:0];
    
    // Insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{
    NSLog(@"In toggle edit mode");
    if (self.isEditing) {
        // turn off the editing mode
        
        [self setEditing:NO animated:YES];
        // change the title of the button to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }
    else {
        // turn on the editing mode
        [self setEditing:YES animated:YES];
        // change the title of the button to inform user of state
        NSLog(@"In Done Part");
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                        message:@"Are you sure you want to delete?"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Delete", nil];
        
        
        self.indexToDelete = [[NSIndexPath alloc] init];
        self.indexToDelete = indexPath;
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSArray *items = [[RecieptItemStore sharedStore] allItems];
        RecieptItem *item = items[self.indexToDelete.row];
        [[RecieptItemStore sharedStore] removeItem:item];
        
        // also remove the item from the view
        [self.tableView deleteRowsAtIndexPaths:@[self.indexToDelete]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        [self.tableView reloadRowsAtIndexPaths:@[self.indexToDelete]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[RecieptItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row = %ld", (long)indexPath.row);
    if (indexPath.row == [[[RecieptItemStore sharedStore] allItems] count]) {
        return NO;
    }
    
    return YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row == [[[RecieptItemStore sharedStore] allItems] count]) {
        return [NSIndexPath indexPathForRow:proposedDestinationIndexPath.row - 1
                                  inSection:0];
    }
    
    return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != [[[RecieptItemStore sharedStore] allItems] count]) {
        RecieptDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        
        NSArray *array = [[RecieptItemStore sharedStore] allItems];
        RecieptItem *item = array[indexPath.row];
        
        detailView.item = item;
        
        // push it onto the top of the navigation controller's stack
        [self.navigationController pushViewController:detailView animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}
@end