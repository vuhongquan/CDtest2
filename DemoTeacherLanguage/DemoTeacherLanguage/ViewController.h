//
//  ViewController.h
//  DemoTeacherLanguage
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeacherObject.h"
#import "Object.h"
@interface ViewController : UIViewController
@property (nonatomic,strong) TeacherObject *object;
@property (nonatomic,strong) Object *object1;
@property (nonatomic,strong) NSMutableArray *arrayTeaching;
@property (nonatomic,strong) NSMutableArray *arrayLearning;
@end
