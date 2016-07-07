//
//  ViewController.m
//  UseGoogleProtoBufDemo
//
//  Created by leiyiming on 7/7/16.
//  Copyright © 2016 leiyiming. All rights reserved.
//

#import "ViewController.h"
#import "Test.pbobjc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UserInfo * info = [[UserInfo alloc] init];
    info.address = @"测试地址";
    info.nickName = @"昵称";
    info.uid = 2341;
    info.phone = @"13811111111";
    NSLog(@"userinfo对象:%@", info);
    //持久化存储
    NSData * infoData = info.data;
    NSString * filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"userinfo"];
    NSLog(@"持久化存储文件路径:%@，文件大小:%ld字节", filePath, (long)[infoData length]);
    [infoData writeToFile:filePath atomically:YES];
    //还原持久化存储
    NSError * error = nil;
    NSData * recoverInfoData = [NSData dataWithContentsOfFile:filePath];
    UserInfo * recoverInfo = [[UserInfo alloc] initWithData:recoverInfoData error:&error];
    NSLog(@"还原的持久化userinfo:%@", recoverInfo);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
