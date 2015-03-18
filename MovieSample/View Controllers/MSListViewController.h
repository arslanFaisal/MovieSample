//
//  ViewController.h
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.


// This Controller is responsible to show all the UI of the images and headlines list, It has a UITableViewController added as a subview to display the list.

#import <UIKit/UIKit.h>
#import "MSNetworkManager.h"
@interface MSListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,MSNetworkManagerDelegate>
{
    NSMutableArray *listDataArray; // To keep the movie items
    IBOutlet UITableView *listTblView; // To show data on the view
}
@end

