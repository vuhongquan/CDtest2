//
//  TableViewLearningJapanese.h
//  DemoTeacherLanguage
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Object.h"
#import "TeacherObject.h"
@interface TableViewLearningJapanese : UIViewController<UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate>
@property (nonatomic, strong)AVAudioPlayer *audioPlayer;
@property (nonatomic,strong)NSArray *arrayTeacher;
@property (nonatomic,strong)Object *object;
@property (nonatomic,strong)TeacherObject *objectTeach;
@end
