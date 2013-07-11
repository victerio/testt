//
//  VVCMasterViewController.h
//  testt
//
//  Created by victerio on 7/4/13.
//  Copyright (c) 2013 victerio. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VVCContactViewController.h"
#import "VVCBioViewController.h"
#import "VVCsql.h"
#import "Param.h"
@interface VVCMasterViewController : UITableViewController{

}
@property NSMutableArray *lines;
@property VVCsql *bs;
@property VVCContactViewController *cvc;
@property VVCBioViewController *bvc;
@property Param *par;
@end
