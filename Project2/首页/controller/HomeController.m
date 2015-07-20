//
//  HomeController.m
//  Project2
//
//  Created by lanqs on 15/7/13.
//  Copyright (c) 2015年 lanqs. All rights reserved.
//

#import "HomeController.h"
#import "DrawUpDownMenu.h"

@interface HomeController ()<DrawUpDownMenuDelegate>

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*设置导航栏上面的内容*/
//左侧item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftClick) image:@"navigationbar_friendsearch" highlightImage:@"navigationbar_friendsearch_highlighted"];
    
//右侧item
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightClick) image:@"navigationbar_pop" highlightImage:@"navigationbar_pop_highlighted"];
    
//中间
    //1.创建btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.width = 200;
    btn.height = 30;

    //2.设置字体属性
    [btn setTitle:@"首页" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    //3.设置普通状态图片
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    
    //4.设置选中状态图片
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    
    //5.添加监听
    [btn addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //6.设置图片与titile位置
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 75, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    self.navigationItem.titleView = btn;
}

//左侧item点击
- (void)leftClick
{
    CusLog(@"1111");
  
}

//中间item点击
- (void)centerClick:(UIButton *)sender
{
    //设置btn的选中状态
    sender.selected = YES;
    DrawUpDownMenu *menu = [DrawUpDownMenu menu];
    menu.delegate = self;
    UITableView *tableView = [[UITableView alloc] init];
    tableView.height = 44 * 3;
    menu.content = tableView;
    [menu showFrom:sender];
}

//右侧item点击
- (void)rightClick
{
    NSLog(@"2222");
}

#pragma mark - DrawUpDownMenuDelegate methods
- (void)dismissDidClick
{
    UIButton *btn = (UIButton *)self.navigationItem.titleView;
    //将btn的选中状态设为no
    btn.selected = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
