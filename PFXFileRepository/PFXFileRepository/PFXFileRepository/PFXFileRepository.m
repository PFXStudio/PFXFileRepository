//
//  PFXFileRepository.m
//  PFXFileRepository
//
//  Created by succorer on 2016. 1. 8..
//  Copyright © 2016년 succorer. All rights reserved.
//

#import "PFXFileRepository.h"

@implementation PFXFileRepository

+ (void)saveFileWithUrl:(NSURL *)url filePath:(NSString *)filePath completion:(void (^)(NSString *filePath))completion failure:(void (^)(NSError *error))failure
{
    NSString *folderPath = [filePath stringByDeletingLastPathComponent];
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:& error];
    if (error != nil)
    {
        failure(error);
        return;
    }
    
    NSData *downData = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingUncached
                                               error:&error];
    if (error != nil)
    {
        failure(error);
        return;
    }
    
    BOOL isSaved = [downData writeToFile:filePath atomically:NO];
    if (isSaved == NO)
    {
        error = [NSError errorWithDomain:[NSString stringWithFormat:@"%s", __func__] code:-100 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"fail writeToFile", @"comment", nil]];
        failure(error);
        return;
    }
    
    completion(filePath);
}

+ (void)fileListWithFolderPath:(NSString *)folderPath completion:(void (^)(NSArray *files))completion failure:(void (^)(NSError *error))failure
{
    NSURL *folderUrl = [NSURL URLWithString:folderPath];
    NSDirectoryEnumerator *dirEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:folderUrl includingPropertiesForKeys:[NSArray arrayWithObjects:NSURLNameKey, NSURLIsDirectoryKey, nil] options:NSDirectoryEnumerationSkipsSubdirectoryDescendants  errorHandler:nil];
    NSMutableArray *files = [NSMutableArray array];
    for (NSURL *fileUrl in dirEnumerator)
    {
        NSString *fileName;
        [fileUrl getResourceValue:& fileName forKey:NSURLNameKey error:NULL];
        NSNumber *isDirectory;
        [fileUrl getResourceValue:& isDirectory forKey:NSURLIsDirectoryKey error:NULL];
        [files addObject:fileName];
    }
    
    completion(files);
}

+ (void)removeFileWithFilePath:(NSString *)filePath completion:(void (^)(void))completion failure:(void (^)(NSError *error))failure
{
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:& error];
    if (error != nil)
    {
        failure(error);
        return;
    }
    
    completion();
}

@end
