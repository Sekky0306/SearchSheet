//
//  ViewController.m
//  SearchSheet
//
//  Created by 関戸優紀 on 2015/05/15.
//  Copyright (c) 2015年 関戸優紀. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    IBOutlet UIPickerView *picker;
    NSArray *ballParkArray;
    IBOutlet UITextField *tf1;
    IBOutlet UITextField *tf2;
    IBOutlet UITextField *tf3;
    IBOutlet UITextField *tf4;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    ballParkArray = [NSArray arrayWithObjects:@"横浜スタジアム",@"東京ドーム",@"神宮球場",nil];
    label1.text=(@"塁側");
     label2.text=(@"通路");
     label3.text=(@"列");
     label4.text=(@"番");
    tf1.delegate=self;
    tf2.delegate=self;
    tf3.delegate=self;
    tf4.delegate=self;

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


//ピッカーに表示する行数を返す

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return ballParkArray.count;
}


// 行のサイズを変更


//ピッカーに表示する値を返す

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return ballParkArray[row];}


//ピッカーの選択行が決まったとき

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@が選択されました",ballParkArray[row]);
}
/*
if (pickerView isEqualToString:@"横浜スタジアム"){
  label1.text=(@"ゲート");
}else{
    label1.text=(@"整理番号");

}
*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
