//
//  Dv_ViewController.m
//  CIImageFilters
//
//  Created by Jeffry Bobb on 1/21/14.
//  Copyright (c) 2014 Develomentional, LLC. All rights reserved.
//

#import "Dv_ViewController.h"

@interface Dv_ViewController ()
@property (nonatomic,strong)NSIndexPath* TableIndexPath;
@end

@implementation Dv_ViewController

-(NSArray*)filters
{
    if (!_filters) {
        _filters = [[NSArray alloc]init];
        
    }
    
    _filters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
    for (NSString *filter in _filters) {
        NSLog(@"filter name %@", filter);
        NSLog(@"filter %@", [[CIFilter filterWithName:filter] attributes]);
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
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
    }
    return _tableView;
}
- (void)viewDidLoad
{
    

        


}

- (void)didReceiveMemoryWarning
{
    
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
    static NSString *CellIdentifier = @"SpecieCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.filters objectAtIndex:indexPath.row];
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _TableIndexPath = indexPath;

    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateSegue"]) {
     ///uncomment for logging
        NSLog(@"%@",[self.filters objectAtIndex:[self.tableView indexPathForSelectedRow].row]);
        
    }
    
}



@end
