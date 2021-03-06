//
//  SDCollectionViewCell.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


/*
 
 *********************************************************************************
 *
 * 在您使用此自动轮播库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 * 另（我的自动布局库SDAutoLayout）：
 *  一行代码搞定自动布局！支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于
 *  做最简单易用的AutoLayout库。
 * 视频教程：http://www.letv.com/ptv/vplay/24038772.html
 * 用法示例：https://github.com/gsdios/SDAutoLayout/blob/master/README.md
 * GitHub：https://github.com/gsdios/SDAutoLayout
 *********************************************************************************
 
 */


#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"

@implementation SDCollectionViewCell
{
    __weak UILabel *_titleLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setUpBackGroundView];

        [self setupTitleLabel];
    }
    
    return self;
}

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor
{
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
//    _titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = RGB(255, 255, 255);
    _titleLabel.font = [UIFont systemFontOfSize:15];
}

- (void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont
{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self addSubview:imageView];
}
-(void)setUpBackGroundView{
    UIView *imageView = [[UIView alloc] init];
    imageView.backgroundColor = [UIColor blackColor];
    imageView.alpha = 0.5;
    _backGroundView = imageView;
    [self addSubview:imageView];
    
    
}


- (void)setupTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self addSubview:titleLabel];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
    _backGroundView.frame = CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 30);
    

    CGFloat titleLabelW = self.sd_width;
    CGFloat titleLabelH = _titleLabelHeight;
    CGFloat titleLabelX = 0;
    CGFloat titleLabelY = self.sd_height - titleLabelH;
    UIImageView *zhezhaoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.sd_height)];
//    zhezhaoImage.contentMode = UIViewContentModeCenter;
//    zhezhaoImage.image = [UIImage imageNamed:@"dazhezhao@2x.png"];
    [self addSubview:zhezhaoImage];
    _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY -1, titleLabelW, titleLabelH);
    _titleLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    _titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:13];
    _titleLabel.hidden = !_titleLabel.text;
}

@end
