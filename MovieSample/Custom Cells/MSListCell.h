//
//  MSListCell.h
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.

//The Custom Cell used to display image and headline title

#import <UIKit/UIKit.h>

@interface MSListCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *headlineLbl;
@property (nonatomic,weak) IBOutlet UIImageView *imgView;
-(void) setCellImageWithURL:(NSString*)urlStr;
@end
