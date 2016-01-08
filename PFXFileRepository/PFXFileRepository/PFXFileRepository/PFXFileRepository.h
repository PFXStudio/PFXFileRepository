//
//  PFXFileRepository.h
//  PFXFileRepository
//
//  Created by succorer on 2016. 1. 8..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFXFileRepository : NSObject

+ (void)saveFileWithUrl:(NSURL *)url filePath:(NSString *)filePath completion:(void (^)(NSString *filePath))completion failure:(void (^)(NSError *error))failure;
+ (void)fileListWithFolderPath:(NSString *)folderPath completion:(void (^)(NSArray *files))completion failure:(void (^)(NSError *error))failure;
+ (void)removeFileWithFilePath:(NSString *)filePath completion:(void (^)(void))completion failure:(void (^)(NSError *error))failure;

@end
