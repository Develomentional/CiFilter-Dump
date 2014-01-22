//
//  Dv_FilterListViewController.h
//  CIImageFilters
//
//  Created by Jeffry Bobb on 1/21/14.
//  Copyright (c) 2014 Develomentional, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dv_FilterListViewController : UITableViewController
@property(nonatomic,strong)NSArray* filters;
@property (nonatomic,strong)NSIndexPath* TableIndexPath;
@end
