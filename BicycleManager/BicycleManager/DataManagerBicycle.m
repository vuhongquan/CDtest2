//
//  DataManagerBicycle.m
//  BicycleManager
//
//  Created by ios12 on 4/12/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "DataManagerBicycle.h"
#import "Object.h"
@implementation DataManagerBicycle
{
    NSMutableArray *_arrayObject1;
}
- (id)init {
    if (self = [super init]) {
        NSString *dataPath1 = [[NSBundle mainBundle]pathForResource:@"Bicycle" ofType:@"plist"];
        _arrayBicycle = [[NSArray alloc]initWithContentsOfFile:dataPath1];
        //_arrayObject1 = [NSMutableArray new];
    }

    return self;
}
+ (id)sharedManager1{
    static DataManager *dataManagerBicycle = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        dataManagerBicycle = [self new];
    });
    return dataManagerBicycle;
}
@end
