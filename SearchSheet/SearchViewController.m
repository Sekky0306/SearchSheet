//
//  SearchViewController.m
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/18.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController


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
