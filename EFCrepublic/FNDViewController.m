//
//  FNDViewController.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDViewController.h"

@interface FNDViewController ()

@end

@implementation FNDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEntryName:(NSString *)name
{
   // self.nameTextField.text = name;
}


- (void)setEntryDueDate:(NSDate *)date
{
 //   [self.datePicker setDate:date];
}


- (void)setMinimumDueDate:(NSDate *)date
{
 //   self.minimumDate = date;
 //   self.datePicker.minimumDate = date;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
