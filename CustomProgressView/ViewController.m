//
//  ViewController.m
//  CustomProgressView
//
//  Created by DaXiong on 17/3/21.
//
//

#import "ViewController.h"
#import "CTMProgressView.h"

@interface ViewController ()

@property (nonatomic,strong)CTMProgressView *progressView;
@property (nonatomic,strong)UILabel *progressLb;
@property (nonatomic,strong)UIButton *resetBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}

- (void)setUp
{
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.progressLb];
    [self.view addSubview:self.resetBtn];
}

- (void)resetProgress
{
    //生成100以内随机数
    NSInteger num = arc4random()%100;
    CGFloat pro = num/100.0;
    _progressView.progress = pro;
    _progressLb.text = [NSString stringWithFormat:@"%ld%%",num];
}

#pragma mark - setters And getters
- (CTMProgressView *)progressView
{
    if (!_progressLb) {
        _progressView = [[CTMProgressView alloc] initWithFrame:CGRectMake(20, 150, 250, 18) Progress:1.0];
    }
    return _progressView;
}

- (UILabel *)progressLb
{
    if (!_progressLb) {
        _progressLb = [[UILabel alloc] initWithFrame:CGRectMake(285, 150, 40, 18)];
        _progressLb.text = @"0";
        _progressLb.textColor = [UIColor blueColor];
        _progressLb.font = [UIFont systemFontOfSize:15];
    }
    return _progressLb;
}

- (UIButton *)resetBtn
{
    if (!_resetBtn) {
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetBtn.frame = CGRectMake(140, 200, 40, 20);
        _resetBtn.backgroundColor = [UIColor redColor];
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_resetBtn addTarget:self action:@selector(resetProgress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
