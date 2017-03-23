//
//  CTMProgressView.h
//  CustomProgressView
//
//  Created by DaXiong on 17/3/21.
//
//

#import <UIKit/UIKit.h>

@interface CTMProgressView : UIView

//进度填充部分显示的图像
@property(nonatomic,strong)UIImageView *progressView;

//进度未填充部分显示的图像
@property(nonatomic,strong)UIImageView *trackView;

@property(nonatomic,assign)CGFloat progress;

- (instancetype)initWithFrame:(CGRect)frame Progress:(CGFloat)progress;

@end
