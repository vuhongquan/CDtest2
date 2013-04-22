//
//  DataManager.h
//  DemoTeacherLanguage
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
@property (nonatomic,strong) NSArray *arrayTeach;
+(id)sharedManager;
@end
