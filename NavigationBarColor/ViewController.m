//
//  ViewController.m
//  NavigationBarColor
//
//  Created by WeibaYeQiang on 16/5/11.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Awesome.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.alpha = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 38)];
    [button addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"菜单" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *menu = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menu;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
//    [self scrollViewDidScroll:tableView];
}
- (void)menuAction:(UIButton *)button {
    NSLog(@"dianji ");
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section?44:200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
        cell.textLabel.text = [NSString stringWithFormat:@"section = %ld,row = %ld",indexPath.section,indexPath.row];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGFloat height = section?44:200;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, height)];
    headView.backgroundColor = [UIColor yellowColor];
    if (!section) {
        headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"H8C{TP21G[CH]GGEDJY[M5E.jpg"]];
        return headView;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 375, 44)];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    [headView addSubview:label];
    return headView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat apla = offset / 136.0;
    UIColor *color = [UIColor blueColor];
    [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:apla]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
