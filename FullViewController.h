//
//  FullViewController.h
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/24.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullViewController : UIViewController
<UIScrollViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    UIImageView *myImage;
    
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *myImage;

- (IBAction)back2;

@end
