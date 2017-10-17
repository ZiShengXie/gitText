//
//  ViewController.m
//  gitText
//
//  Created by zisheng xie on 2017/10/13.
//  Copyright © 2017年 zisheng xie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy) NSArray *vcNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeMainView];
}

#pragma mark - 创建界面
-(void)makeMainView{
    self.array = @[@"2017.10.17 masory的基本用法"];
    self.vcNames = @[@"MaosryViewController"];
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    WeakSelf(weakSelf);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.width.mas_equalTo(weakSelf.view.mas_width);
        make.height.mas_equalTo(weakSelf.view.mas_height);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView registerClass:[UITableViewCell classForCoder] forCellReuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class vcClass = NSClassFromString(self.vcNames[indexPath.row]);
    [self.navigationController pushViewController:[[vcClass alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
