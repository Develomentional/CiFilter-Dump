//
//  Dv_AllCategoriesViewController.m
//  CIImageFilters
//
//  Created by Jeffry Bobb on 1/25/14.
//  Copyright (c) 2014 Develomentional, LLC. All rights reserved.
//

#import "Dv_AllCategoriesViewController.h"

@interface Dv_AllCategoriesViewController ()
@property(nonatomic,strong)NSMutableArray* FiltersInCatSections;
@end

@implementation Dv_AllCategoriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSMutableArray*)FiltersInCatSections
{
    if (!_FiltersInCatSections) {
        _FiltersInCatSections = [[NSMutableArray alloc]init];
    }
    return _FiltersInCatSections;
}
-(NSArray*)allCategories
{
    if (!_allCategories)
    {
        _allCategories = @[@"CICategoryBlur",@"CICategoryColorAdjustment",@"CICategoryColorEffect",@"CICategoryCompositeOperation",@"CICategoryDistortionEffect",@"CICategoryGenerator",@"CICategoryGeometryAdjustment",@"CICategoryGradient",@"CICategoryHalftoneEffect",@"CICategoryReduction",@"CICategorySharpen",@"CICategoryStylize",@"CICategoryTileEffect",@"",@"CICategoryTransition"];
        for (NSString* cat in _allCategories)
        {
            NSMutableArray* filterInCat = [[NSMutableArray alloc]init];
            for (NSString* filterName in [CIFilter filterNamesInCategory:cat])
                                         {
                                             [filterInCat addObject:filterName];
                                         }
            [self.FiltersInCatSections addObject:filterInCat];
            filterInCat = nil;
            filterInCat = [[NSMutableArray alloc]init];
           
        }
    }
    
    return _allCategories;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   }
- (void)viewDidLoad
{
    [super viewDidLoad];
 self.tableView.sectionIndexBackgroundColor = [UIColor redColor];


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
    return self.allCategories.count;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.allCategories objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.FiltersInCatSections objectAtIndex:section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FilterInCategory";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.FiltersInCatSections objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
