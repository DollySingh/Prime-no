//
//  UpdateDataViewController.m
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "UpdateDataViewController.h"

@interface UpdateDataViewController ()

@end

@implementation UpdateDataViewController

- (IBAction)OnDeleteEmpRecord:(id)sender
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:_context]];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eno == %@", _txtEno.text];
    [request setPredicate:predicate];
    
    NSArray *results = [_context executeFetchRequest:request error:&error];
    
    
    for( Employee *temp  in   results )
    {
        [_context deleteObject:temp];
    }
    
    [self.navigationController popViewControllerAnimated:YES];

    if(YES == [_context save:nil])
    {
        NSLog(@"Record Deleted successfully");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Failed to Delete record");
    }
}

-(void) InitPage
{
    UIApplication *myapplication=  [UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
    _context=  myappdelegate.managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txtEno.text = _m_eno;
    _txtEName.text = _m_ename;
    _txtEAddress.text = _m_eaddress;
    _txtEPhonno.text = _m_ephoneno;
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

- (IBAction)OnUpdateEmpRecord:(id)sender
{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:_context]];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eno == %@", _txtEno.text];
    [request setPredicate:predicate];
    
    NSArray *results = [_context executeFetchRequest:request error:&error];

    
    for( Employee *temp  in   results )
    {
        temp.ename = _txtEName.text;
        temp.eaddress = _txtEAddress.text;
        temp.ephoneno = [NSNumber numberWithInteger:[ _txtEPhonno.text integerValue]];;
    }
    if(YES == [_context save:nil])
    {
        NSLog(@"Record Updated successfully");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Failed to update record");
    }
}
@end
