//
//  InsertRecordViewController.h
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "AppDelegate.h"

@interface InsertRecordViewController : UIViewController
- (IBAction)OnSaveButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtEno;
@property (weak, nonatomic) IBOutlet UITextField *txtEname;
@property (weak, nonatomic) IBOutlet UITextField *txtEAdress;
@property (weak, nonatomic) IBOutlet UITextField *txtEphono;

@property (nonatomic,retain)  NSManagedObjectContext *context;

-(void) InitPage;

@end
