//
//  ViewController.m
//  UI-01-图片轮播
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZLoopView.h"

// 类扩展／匿名分类，定义私有属性／方法
@interface ViewController ()

@end

/**
 属性和成员变量的区别？
 
 - 属性：提供了 getter & setter / 成员变量
 - 成员变量
 
 真正保存数据的是`成员变量`
 */
@implementation ViewController {
    NSArray <NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载数据
    [self loadData];
    
    NSLog(@"%@", _urls);
    
    // 创建 界面
    CZLoopView *loopView = [[CZLoopView alloc] initWithURLs:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 200);
    
    [self.view addSubview:loopView];
}

- (void)loadData {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg", (i + 1)];
        
        // 提示：如果 fileName 不存在 url 返回 nil
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        
        [arrayM addObject:url];
    }
    
    _urls = arrayM.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
