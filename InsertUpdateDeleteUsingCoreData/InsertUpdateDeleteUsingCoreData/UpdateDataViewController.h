//
//  UpdateDataViewController.h
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "AppDelegate.h"

@interface UpdateDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtEno;

@property (weak, nonatomic) IBOutlet UITextField *txtEName;

@property (weak, nonatomic) IBOutlet UITextField *txtEAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtEPhonno;

@property NSString *m_eno;
@property NSString *m_ename;
@property NSString *m_eaddress;
@property NSString *m_ephoneno;

- (IBAction)OnUpdateEmpRecord:(id)sender;

@property (nonatomic,retain)  NSManagedObjectContext *context;

- (IBAction)OnDeleteEmpRecord:(id)sender;


-(void) InitPage;

@end
