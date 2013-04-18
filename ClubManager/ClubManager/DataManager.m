//
//  DataManager.m
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
- (id)init {
    if (self = [super init]) {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"ClubList" ofType:@"plist"];
        _arrayClub = [[NSArray alloc] initWithContentsOfFile:dataPath];
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
