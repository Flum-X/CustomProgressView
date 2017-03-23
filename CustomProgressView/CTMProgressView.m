//
//  CTMProgressView.m
//  CustomProgressView
//
//  Created by DaXiong on 17/3/21.
//
//

#import "CTMProgressView.h"

@implementation CTMProgressView

- (instancetype)initWithFrame:(CGRect)frame Progress:(CGFloat)progress
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGSize size = self.frame.size;
        _trackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _trackView.image = [UIImage imageNamed:@"progress_trackImg"];//进度未填充部分显示的图片
        [self addSubview:_trackView];
        
        UIView *progressBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        progressBgView.clipsToBounds = YES;//当前view的主要作用是将出界了的_progressView剪切掉，所以需将clipsToBounds设置为YES
        
        [self addSubview:progressBgView];
        _progressView = [[UIImageView alloc] init];
        _progressView.image = [UIImage imageNamed:@"progress_proImg"];//进度填充部分显示的图片
        
        self.progress = progress;
        [progressBgView addSubview:_progressView];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    if (progress < 0) {
        progress = 0.f;
    }
    
    CGSize size = self.frame.size;
    
    /**
     *image的宽和高不变，将x轴的坐标根据progress的大小左右移动即可显示出进度的大小，progress的值介于0.0至1.0之间
     *_progressView的父级view上clipsToBounds属性为YES，所以当_progressView的frame出界后不会被显示出来
     */
    _progressView.frame = CGRectMake(size.width * progress-size.width,0, size.width, size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
