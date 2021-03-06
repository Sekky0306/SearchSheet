//
//  SearchViewController.m
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/18.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import "SearchViewController.h"
//#import "ViewController.m"


@implementation SearchViewController{
    IBOutlet UIScrollView *scrollView;
    UIImageView *imageView;
    UIImageView *gateImage;
    UIImageView *tuuroImage;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 5.0;
    scrollView.minimumZoomScale = 1.0;
    
       imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.image = [UIImage imageNamed:@"park.png"];
    [scrollView addSubview:imageView];
    scrollView.contentSize = CGSizeMake(320,320);
   Line *testDraw =
    [[Line alloc] initWithFrame:
     CGRectMake(0.f,0.f,self.view.frame.size.width-80.f,self.view.frame.size.height-140.f)];
    testDraw.backgroundColor = [UIColor clearColor];

    [self.view addSubview:testDraw];
    gateImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 50, 50)];
    gateImage.image = [UIImage imageNamed:@"door.png"];
    [scrollView addSubview:gateImage];
    [self.view addSubview:testDraw];
    tuuroImage = [[UIImageView alloc] initWithFrame:CGRectMake(170, 170, 50, 50)];
   tuuroImage.image = [UIImage imageNamed:@"tuuro.png"];
    [scrollView addSubview:tuuroImage];
}
- (void)didReceiveMemoryWarning {
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
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
