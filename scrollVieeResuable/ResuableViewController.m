//
//  ResuableViewController.m
//  scrollVieeResuable
//
//  Created by wangguopeng on 16/2/1.
//  Copyright © 2016年 . All rights reserved.
//

#import "ResuableViewController.h"
#import "reScrollView.h"
#import "Masonry.h"
@interface ResuableViewController ()
@property (nonatomic,strong)reScrollView *resuableScroll;
@end

@implementation ResuableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.title = @"瑞雪照丰年";
    [self setUpView];
}

- (void)setUpView{
    self.resuableScroll = [[reScrollView alloc]initWithFrame:CGRectZero andOwner:self];
    self.resuableScroll.picArray = @[@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",];
    self.resuableScroll.infoArray = @[@"今年过年好天气",@"瑞雪兆丰年",@"头可断,血可流,wifi不能断",@"加把劲儿"];
    [self.view addSubview:self.resuableScroll];
    [self setConstraint];
}

- (void)setConstraint{
    [self.resuableScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.top.equalTo(self.view.mas_top);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

@end
