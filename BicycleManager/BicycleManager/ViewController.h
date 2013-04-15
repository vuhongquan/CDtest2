//
//  ViewController.h
//  ObjectManager
//
//  Created by ios12 on 4/9/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
@interface ViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic) Object * object;
@property (nonatomic,strong) NSString * loaixe;
@end
