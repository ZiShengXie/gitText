//
//  MaosryViewController.m
//  gitText
//
//  Created by zisheng xie on 2017/10/17.
//  Copyright © 2017年 zisheng xie. All rights reserved.
//

#import "MaosryViewController.h"

@interface MaosryViewController ()
@property (nonatomic,strong) UIButton *iconBtn;
@property (nonatomic,strong) UILabel *iconLanel;
@property (nonatomic,strong) UIImageView *editIcon;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIView *separeLine;
@end

@implementation MaosryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeMainView];
    [self setupFrame];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建主界面
-(void)makeMainView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.iconBtn = [[UIButton alloc] init];
    [self.view addSubview:self.iconBtn];
    self.iconBtn.layer.cornerRadius = 45;
    self.iconBtn.backgroundColor = [UIColor redColor];
    self.iconBtn.clipsToBounds = YES;
    
    self.iconLanel = [UILabel new];
    [self.view addSubview:self.iconLanel];
    self.iconLanel.text = @"上传社区头像";
    self.iconLanel.textAlignment = NSTextAlignmentCenter;
    self.iconLanel.font = [UIFont systemFontOfSize:15];
    
    self.editIcon = [UIImageView new];
    [self.view addSubview:self.editIcon];
    [self.editIcon setBackgroundColor:[UIColor blueColor]];
    
    self.textField = [UITextField new];
    [self.textField setPlaceholder:@"请输入社区名字"];
    [self.view addSubview:self.textField];
    
    self.separeLine = [UIView new];
    [self.view addSubview:self.separeLine];
    self.separeLine.backgroundColor = [UIColor lightGrayColor];
    
}

#pragma mark - masory布局
-(void)setupFrame{
    WeakSelf(weakSelf);
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.top.with.mas_offset(90);
    }];
    
    [self.iconLanel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.iconBtn);
        make.top.mas_equalTo(weakSelf.iconBtn.mas_bottom).with.mas_offset(20);
    }];
    
    [self.editIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.mas_equalTo(weakSelf.view.mas_left).with.mas_offset(20);
        make.top.mas_equalTo(weakSelf.iconLanel.mas_bottom).with.mas_offset(20);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat width = kScreenWidth - 45 - 20;
        make.width.mas_equalTo(width);
        make.left.mas_equalTo(weakSelf.editIcon.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(weakSelf.editIcon.mas_centerY);
        make.height.mas_equalTo(34);
        
    }];
    
    [self.separeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.editIcon.mas_left);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(weakSelf.textField.mas_bottom);
        make.width.mas_equalTo(kScreenWidth - 40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
