//
//  InsertRecordViewController.m
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "InsertRecordViewController.h"

@interface InsertRecordViewController ()

@end

@implementation InsertRecordViewController

-(void) InitPage
{
    UIApplication *myapplication=  [UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
   _context=  myappdelegate.managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self InitPage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)OnSaveButton:(id)sender
{
    
    
    Employee *emp=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_context];

    emp.eno = [NSNumber numberWithInteger:[_txtEno.text integerValue]];
    emp.ename = _txtEname.text;
    emp.eaddress = _txtEAdress.text;
    emp.ephoneno =[NSNumber numberWithInteger:[_txtEphono.text integerValue]];
    
    if(YES == [_context save:nil])
    {
        NSLog(@"Record inserted.");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Failed to insert record.");
    }
}
@end
