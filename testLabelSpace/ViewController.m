//
//  ViewController.m
//  testLabelSpace
//
//  Created by wangjianfei on 2019/1/24.
//  Copyright © 2019年 wangjianfei. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+YXUI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"好的生活\n没那么贵";
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    NSDictionary *attribute = @{NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString addAttributes:attribute range:NSMakeRange(0, str.length)];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 0, 0)];
    [self.view addSubview:label1];
    label1.font = [UIFont systemFontOfSize:16.0];
    label1.numberOfLines = 0;
    label1.attributedText = attributedString;
    label1.backgroundColor = [UIColor lightGrayColor];
    [label1 sizeToFit];
    
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    [self.view addSubview:label1];
    label1.numberOfLines = 0;
    label1.font = [UIFont systemFontOfSize:16.0];
    label1.yxText = str;
    label1.backgroundColor = [UIColor lightGrayColor];
    [label1 sizeToFit];

}


@end
