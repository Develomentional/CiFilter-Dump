//
//  Dv_FilterAttributesViewController.m
//  CIImageFilters
//
//  Created by Jeffry Bobb on 1/21/14.
//  Copyright (c) 2014 Develomentional, LLC. All rights reserved.
//

#import "Dv_FilterAttributesViewController.h"
#import "Dv_AttributeDetailsViewController.h"
NSString* categoryKey = @"CIAttributeFilterCategories";
@interface Dv_FilterAttributesViewController ()
@property(nonatomic,strong)NSArray* categoriesForFilter;
@end

@implementation Dv_FilterAttributesViewController
-(NSDictionary*)filterAttributes
{
    if (!_filterAttributes) {
        _filterAttributes = [[NSDictionary alloc]init];
    }

    return _filterAttributes;
    
}
-(NSArray*)categoriesForFilter
{
    if (!_categoriesForFilter) {
        _categoriesForFilter = [[NSArray alloc]init];
    }
    return _categoriesForFilter;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    return self.filterAttributes.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.filterAttributes.allKeys objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[self.filterAttributes.allValues objectAtIndex:indexPath.row]];
   // NSLog(@"%@",[self.filterAttributes.allValues objectAtIndex:indexPath.row]);
    return cell;
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",self.filterAttributes);
  //  self.categoriesForFilter = self.filterAttributes[categoryKey];
    /*
    NSMutableArray* details = [[NSMutableArray alloc]init];
    for (NSDictionary* strings in [self.filterAttributes.allValues objectAtIndex:indexPath.row])
    {
        for (NSString* key in strings.allKeys)
        {
            NSLog(@"%@ Keys",key);
           if ([key isEqualToString:categoryKey])
            {
                details = [strings valueForKey:categoryKey];
            }
   
        }
        //self.categoriesForFilter = details;
        
    }    */
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

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    if ([identifier isEqualToString:@"filterCategories"]) {
        return YES;
    }
    
    if ([[self.filterAttributes.allValues objectAtIndex:[self.tableView indexPathForSelectedRow].row]isKindOfClass:[NSString class]] ) {
        return NO;
    }
    
    
    
    return YES;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    [super performSegueWithIdentifier:identifier sender:sender];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"attribDetails"]) {
        NSMutableArray* details = [[NSMutableArray alloc]init];
        for (NSDictionary* strings in [self.filterAttributes.allValues objectAtIndex:[self.tableView indexPathForSelectedRow].row]) {
            [details addObject:strings];
            
        }
       // NSLog(@"%@",details);
         [segue.destinationViewController setDetails:details];
        [segue.destinationViewController setDetailDictionary:self.filterAttributes];

    }
    if ([segue.identifier isEqualToString:@"filterCategories"]) {
     
 NSMutableArray* det = [[NSMutableArray alloc]init];
      NSLog(@"cat key:%@",self.filterAttributes[categoryKey]);
        for (NSString* val in self.filterAttributes[categoryKey]) {
            [det addObject:val];
        }
        

        [segue.destinationViewController setFilterCategories:det];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end
