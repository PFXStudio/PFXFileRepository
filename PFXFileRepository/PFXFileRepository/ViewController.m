//
//  ViewController.m
//  PFXFileRepository
//
//  Created by succorer on 2016. 1. 8..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import "ViewController.h"
#import "PFXFileRepository.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonTouched:(id)sender {
    NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [dirs objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"PFXFolder"];
    path = [path stringByAppendingPathComponent:@"test.png"];
    
    [PFXFileRepository saveFileWithUrl:[NSURL URLWithString:@"https://www.google.co.kr/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"] filePath:path completion:^(NSString *filePath) {
        NSLog(@"%@", filePath);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)searchButtonTouched:(id)sender {
    NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [dirs objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"PFXFolder"];

    [PFXFileRepository fileListWithFolderPath:path completion:^(NSArray *files) {
        NSLog(@"%@", files);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)removeButtonTouched:(id)sender {
    NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [dirs objectAtIndex:0];
    path = [path stringByAppendingPathComponent:@"PFXFolder"];
    path = [path stringByAppendingPathComponent:@"test.png"];
    
    [PFXFileRepository removeFileWithFilePath:path completion:^{
        NSLog(@"removed File");
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
}


@end
