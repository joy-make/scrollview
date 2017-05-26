//
//  ResuableScrollView.m
//  scrollVieeResuable
//
//  Created by wangguopeng on 16/2/1.
//  Copyright © 2016年 . All rights reserved.
//

#import "reScrollView.h"

@interface reScrollView ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel     *infoLabel;
@property (nonatomic,assign) NSInteger           currentPage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation reScrollView

- (instancetype)initWithFrame:(CGRect)frame andOwner:(UIViewController *)owner{
    if ((self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:owner options:nil] lastObject])){
        owner.automaticallyAdjustsScrollViewInsets = NO;
        [self setFrame:frame];
        self.currentPage = 0;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setContOffSet];
    self.leftImageView.image = [UIImage imageNamed:[self.picArray objectAtIndex:self.picArray.count-1]];
    self.middleImageVIew.image = [UIImage imageNamed:[self.picArray objectAtIndex:0]];
    self.rightImageView.image = [UIImage imageNamed:[self.picArray objectAtIndex:1]];
    self.infoLabel.text = self.infoArray[0];
}

#define CURRENT_INDEX scrollView.contentOffset.x/CGRectGetWidth(scrollView.bounds)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if(CURRENT_INDEX>1)
    self.currentPage = self.currentPage == self.picArray.count-1?0:self.currentPage+1;
    
    if(CURRENT_INDEX<1)
    self.currentPage = self.currentPage == 0?self.picArray.count-1:self.currentPage-1;
    
    NSInteger leftIndex = self.currentPage == 0?self.picArray.count-1:self.currentPage-1;
    
    NSInteger rightIndex = self.currentPage == self.picArray.count -1?0:self.currentPage+1;

    [self setContOffSet];
    
    self.leftImageView.image = [UIImage imageNamed:self.picArray[leftIndex]];
    
    self.middleImageVIew.image = [UIImage imageNamed:self.picArray[self.currentPage]];
    
    self.rightImageView.image = [UIImage imageNamed:self.picArray[rightIndex]];
    
    self.infoLabel.text = self.infoArray[self.currentPage];
}

- (void)setContOffSet{
    
    CGFloat contentSetX = CGRectGetWidth(self.scrollView.bounds);
    
    [self.scrollView setContentOffset:CGPointMake(contentSetX, 0) animated:NO];

}

@end
