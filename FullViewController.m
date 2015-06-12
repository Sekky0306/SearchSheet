//
//  FullViewController.m
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/24.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import "FullViewController.h"

@implementation FullViewController
@synthesize scrollView;
@synthesize myImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"park.png"]];
    [self setMyImage:img];
    
    scrollView.pagingEnabled = NO;
    scrollView.contentSize = CGSizeMake(img.frame.size.width, img.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = YES;
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 4.0;
    scrollView.minimumZoomScale = 0.4;
    
    [scrollView addSubview: img];
    //[img release];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return myImage;
}

-(IBAction)back2{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
