//
//  MSListCell.m
//  MovieSample
//
//  Created by Arslan  on 18/03/2015.
//  Copyright (c) 2015 Arslan . All rights reserved.
//

#import "MSListCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MSListCell

- (void)awakeFromNib {
    // Initialization code
}
-(void) setCellImageWithURL:(NSString*)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.png"];
    __weak MSListCell *weakCell = self;  // we want to keep the refernece to the cell in case its no longer there to avoid memory allocation based crashes insdie the block
    
    //Dowloading the image using AFNetworking image dowloader category method, AFNetworking class by dfault cache the response to caching is handled here. We could have also used NSURLCache and NSURLConnection but AFNetworking is built on top of these classes and is easy to extend and use.
    [self.imgView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       //setting the image and updating the cell UI
                                       weakCell.imgView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
