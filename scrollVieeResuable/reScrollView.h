//
//  ResuableScrollView.h
//  scrollVieeResuable
//
//  Created by wangguopeng on 16/2/1.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reScrollView : UIView
- (instancetype)initWithFrame:(CGRect)frame andOwner:(UIViewController *)owner;
@property (nonatomic,strong) NSArray    *picArray;
@property (nonatomic,strong) NSArray    *infoArray;
@end
