//
//  ViewController.m
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.
//

#import "MSListViewController.h"
#import "MSListCell.h"
#import "MovieSample.h"
@interface MSListViewController ()

@end

@implementation MSListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    listDataArray = [NSMutableArray array];
    // Initializing Network Manager to download the json from the url
    MSNetworkManager *networkManager = [MSNetworkManager sharedManager];
    networkManager.jsonDelegate = self; //setting delegate for url responses
    [networkManager downloadSampleJsonAtURL:JSON_URL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return listDataArray.count;  //number of rows
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LIST_ROW_HEIGHT;  // Custom Height of the cell placed in constants can be changed
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = SAMPLE_CELL_IDENTIFIER;
    MSListCell *cell = (MSListCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    //Since its a prototype cell so it will always return a cell no need for conventional nil check on cell so proceeding with initialization
    
    // getting the custom movie object for the particular index
    MovieSample *movie = [listDataArray objectAtIndex:indexPath.row];
    
    //Settign the images and label
    cell.headlineLbl.text = movie.headline;
    [cell setCellImageWithURL:movie.imageURL];//Image downlaod and cache is inside the cell class called MSListCell
    
    return cell;
}
#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //Do any other selection related stuff, leaving it empty as we don't have detail view
}
#pragma mark - MSNetworkManager Delegate
-(void) getJsonDidSuccessWithJson:(NSArray*)jsonArray{
    //call back from Network manager after successful downlaod of json
    [self setUpImagesAndLoadTableWithArray:jsonArray];
}
-(void) getJsonDidFail:(NSError*)error{
    //call back from Network manager in case downlaod of json fails and showing alert on screen with error
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Json"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}
#pragma mark - custom Methods
-(void)setUpImagesAndLoadTableWithArray:(NSArray*)jsonArray{
    [listDataArray removeAllObjects];//remove all the existing items to use with current downloaded list
    for (NSDictionary *dict in jsonArray) {
        if ([MSUtility removeNullFromDictionary:dict]) {
            MovieSample *movie = [[MovieSample alloc] initWithWithDictionary:dict];//Creating the movie sample object and adding it to data array
            [listDataArray addObject:movie];
        }
    }
    //calling the table reload call on main thread
    [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:NO];
}
-(void)reloadTableView{
    //relaoding table
    [listTblView reloadData];
}
@end
