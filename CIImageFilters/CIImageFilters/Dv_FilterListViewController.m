//
//  Dv_FilterListViewController.m
//  CIImageFilters
//
//  Created by Jeffry Bobb on 1/21/14.
//  Copyright (c) 2014 Develomentional, LLC. All rights reserved.
//

#import "Dv_FilterListViewController.h"
#import "Dv_FilterAttributesViewController.h"
#import "Dv_FilterCategoriesViewController.h"
@interface Dv_FilterListViewController ()

@end

@implementation Dv_FilterListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSArray*)filters
{
    if (!_filters) {
        _filters = [[NSArray alloc]init];
        
    }
    
    _filters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
    for (NSString *filter in _filters) {
     //   NSLog(@"filter name %@", filter);
        //NSLog(@"filter %@", [CIFilter filterNamesInCategory:@""]);
    }
    
    return _filters;
}
-(NSIndexPath*)TableIndexPath
{
    
    if (!_TableIndexPath) {
        _TableIndexPath = [self.tableView indexPathForSelectedRow];
    }
    
    return _TableIndexPath;
}
/*
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
    }
    return _tableView;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.filters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.filters objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation 
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"attributes"]) {
        CIFilter* fitler = [CIFilter filterWithName:[self.filters objectAtIndex:[self.tableView indexPathForSelectedRow].row] ];
        NSDictionary* attribs = [fitler attributes];
        [segue.destinationViewController setFilterAttributes:attribs];
    }
    if ([segue.identifier isEqualToString:@"filterCategories"]) {
        
    }
}



@end
