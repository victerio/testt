//
//  VVCMasterViewController.m
//  testt
//
//  Created by victerio on 7/4/13.
//  Copyright (c) 2013 victerio. All rights reserved.
//

#import "VVCMasterViewController.h"

@interface VVCMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation VVCMasterViewController
@synthesize lines;
@synthesize bs;
@synthesize cvc;
@synthesize bvc;
@synthesize par;
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 //   self.navigationItem.leftBarButtonItem = self.editButtonItem;

/*    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;*/

     cvc =[[VVCContactViewController alloc]init];
     bvc=[[VVCBioViewController alloc] init];
    bs = [[VVCsql alloc]init];
    cvc.name = [[NSMutableArray alloc]init];
    cvc.value = [[NSMutableArray alloc]init];
    bvc.name = [[NSMutableArray alloc]init];
    bvc.value = [[NSMutableArray alloc]init];
     par =[[Param alloc]init];
    
    [bs test1 :par];
    par->imm=[UIImage imageWithData:par->pi];
    [bs test2:cvc.name :cvc.value ];
    [bs test3 :bvc.name :bvc.value];
    lines = [[NSMutableArray alloc]init];    
    [ lines addObject:par->nm];
    [lines addObject:@"Contacts"];
    [lines addObject:@"Bio"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.

      if(indexPath.row==1 ) {
          [self.navigationController
           pushViewController:cvc animated:YES];
      }
     if(indexPath.row==2) {
            [self.navigationController pushViewController:bvc animated:YES];
     }
    
    /*
     DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath ];

      UITableViewCell   *cell= [[UITableViewCell alloc]initWithStyle:              UITableViewCellStyleSubtitle
                                                     reuseIdentifier:@"Cell"];
    if(indexPath.row==0) {
        cell.imageView.image=par->imm;
        cell.detailTextLabel.text = par->bdate;
    }
    cell.textLabel.text = lines[indexPath.row];
 
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{/*
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }*/
}

@end
