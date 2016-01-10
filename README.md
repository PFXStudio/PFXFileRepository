# PFXFileRepository
PFXFileRepository

````
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

````


# PFXStudio

Mobile : http://pfxstudio.modoo.at/

Twitter : http://twitter.com/pfxstudio

Facebook : http://facebook.com/pfxstudio

Github : https://github.com/PFXStudio

iOS AppStore : https://itunes.apple.com/us/artist/ppark/id448017898

Google Play : https://play.google.com/store/apps/developer?id=PFXStudio
