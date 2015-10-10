//
//  ZJHelpWebViewController.m
//  DZDP
//
//  Created by liuzhouji on 15/10/9.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ZJHelpWebViewController.h"

@interface ZJHelpWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ZJHelpWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"客服中心";

    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}



@end
