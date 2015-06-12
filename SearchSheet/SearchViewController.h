//
//  SearchViewController.h
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/18.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
    <UIScrollViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    UIImageView *myImage;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *myImage;

- (IBAction)back;
- (IBAction)share;
- (IBAction)full;

@end
