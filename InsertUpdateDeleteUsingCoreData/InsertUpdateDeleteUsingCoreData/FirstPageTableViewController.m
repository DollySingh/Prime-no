//
//  FirstPageTableViewController.m
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import "FirstPageTableViewController.h"
#import "UpdateDataViewController.h"

@interface FirstPageTableViewController ()

@end

@implementation FirstPageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}
-(void)InitPage
{
    UIApplication *myapplication=  [UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
    _context=  myappdelegate.managedObjectContext;
}
-(void)viewDidAppear:(BOOL)animated
{
    [self InitPage];
    
    _empRecords = [[NSMutableArray alloc] init];
    
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSArray *result = [_context executeFetchRequest:request error:nil];
    
    
    for( Employee *temp  in   result )
    {
        [_empRecords addObject:temp];
    }

    [self.tableView reloadData];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"SegueToUpdateRecord" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [[segue identifier] isEqualToString:@"SegueToUpdateRecord"])
    {
    Employee *emp = [_empRecords objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    UpdateDataViewController *updatePage = [segue destinationViewController];

    updatePage.m_eno = [emp.eno stringValue];
    updatePage.m_ename = emp.ename;
    updatePage.m_eaddress = emp.eaddress;
    updatePage.m_ephoneno = [emp.ephoneno stringValue];
        
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _empRecords.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuse"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    Employee *emp = [_empRecords objectAtIndex:indexPath.row];
    cell.textLabel.text = emp.ename;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
