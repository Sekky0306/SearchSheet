//
//  SearchViewController.m
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/18.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController
@synthesize scrollView;
@synthesize myImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"park.png"]];
    [self setMyImage:img];
    
    scrollView.pagingEnabled = NO;
    scrollView.contentSize = CGSizeMake(img.frame.size.width, img.frame.size.height);
    NSLog(@"%@",NSStringFromCGSize(CGSizeMake(img.frame.size.width, img.frame.size.height)));
       scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    //scrollView.scrollsToTop = YES;
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 4.0;
    scrollView.minimumZoomScale = 0.4;
    scrollView.contentOffset = CGPointMake(img.center.x/1.5, img.center.y/1.5);
    NSLog(@"%@",NSStringFromCGPoint(CGPointMake(img.center.x/1.5, img.center.y/1.5)));

    
    [scrollView addSubview: img];
    //[img release];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return myImage;
}

//- (void)dealloc {
// [super dealloc];
// [myImage release];
// [scrollView release];
//}//


- (void)didReceiveMemoryWarning {
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)postToLine{
    NSString *plainString = @"test"; //シェア内容
    
    // escape
    NSString *contentKey = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                        NULL,
                                                                                        (CFStringRef)plainString,
                                                                                        NULL,
                                                                                        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                        kCFStringEncodingUTF8 );
    
    NSString *contentType = @"text";
    
    // LINE のサイトに遷移して、アプリが入っている場合はラインにリダイレクトする方法。
    /*NSString *urlString = [NSString
                           stringWithFormat: @"http://line.naver.jp/R/msg/%@/?%@",
                           contentType, contentKey];
    NSURL *url = [NSURL URLWithString:urlString];*/
  
     // LINE に直接遷移。contentType で画像を指定する事もできる。アプリが入っていない場合は何も起きない。
     NSString *urlString2 = [NSString
     stringWithFormat:@"line://msg/%@/%@",
     contentType, contentKey];
     NSURL *url = [NSURL URLWithString:urlString2];
    
    
    [[UIApplication sharedApplication] openURL:url];
}
-(IBAction)share{

    [self postToLine];
}
@end
