//
//  FirstPageTableViewController.h
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "AppDelegate.h"

@interface FirstPageTableViewController : UITableViewController
@property (nonatomic,retain)  NSManagedObjectContext *context;
-(void)InitPage;
@property (nonatomic,retain) NSMutableArray *empRecords;

@end
