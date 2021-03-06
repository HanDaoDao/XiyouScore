//
//  ViewController.m
//  XiyouScore
//
//  Created by Tangtang on 16/7/21.
//  Copyright © 2016年 Tangtang. All rights reserved.
//

#import "ViewController.h"
#import "XYSHTTPRequestSession.h"
#import "XYSHTTPRequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    XYSHTTPRequestSession *session = [[XYSHTTPRequestSession alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://139.129.210.109/xuptqueryscore/login.jsp"];
    XYSHTTPRequestManager *requestManager = [XYSHTTPRequestManager createInstance];
    [requestManager postDataWithUrl:url WithParams:@{@"username" : @"04143031", @"password" : @"tn96.0", @"session" : @""} success:^(id dic) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dic options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", dict);
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
//    session.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    NSString *path = NSHomeDirectory();
//    
//    NSString *cacheDiretory= [path stringByAppendingPathComponent:@"Library/Caches/"];
//    
//    cacheDiretory = [cacheDiretory stringByAppendingPathComponent:@"webCache"];
    
//    NSProgress *progress = nil;
    
//    [session downLoadFile:url WithParams:nil fileDownPath:cacheDiretory  progress:&progress success:^(id dic) {
//        [progress removeObserver:self forKeyPath:@"fractionCompleted"];
//        NSLog(@"%@",dic);
//    } error:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    
//    [requestManager downloadFileWithUrl:url WithParams:nil progress:&progress success:^(id dic) {
//        [progress removeObserver:self forKeyPath:@"fractionCompleted"];
//        NSLog(@"%@", dic);
//    } error:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
//    [requestManager postDataWithUrl:url WithParams:nil success:^(id dic) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dic options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@", dict);
//        
//    } error:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    
    
//    [progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:NULL];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"fractionCompleted"] && [object isKindOfClass:[NSProgress class]]) {
        NSProgress *progress = (NSProgress *)object;
        NSLog(@"Progress is %f", progress.fractionCompleted);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
