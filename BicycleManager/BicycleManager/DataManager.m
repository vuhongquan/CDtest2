//
//  DataManager.m
//  BicycleManager
//
//  Created by ios12 on 4/12/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "DataManager.h"
@implementation DataManager
- (id)init {
    if (self = [super init]) {
           NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Suport" ofType:@"plist"];
           _arraySuport = [[NSArray alloc] initWithContentsOfFile:dataPath];
        }
    return self;
}
+ (id)sharedManager {
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        sharedDataManager = [self new];
    });
    return sharedDataManager;
}
@end
