//
//  ViewController.m
//  DemoTeacherLanguage
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewController.h"
#import "TableViewLearningJapanese.h"
@interface ViewController ()
{
    DataManager *_data;
    TableViewLearningJapanese *tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableView = [[TableViewLearningJapanese alloc]init];
    self.title = @"Teach Master";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createViewLanguageButton];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createViewLanguageButton{
    _data=[DataManager sharedManager];
    _arrayTeaching = [NSMutableArray new];
    for (int i =0; i < [_data.arrayTeach count]; i++) {
         NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:_data.arrayTeach[i]];
        _object = [TeacherObject new];
        _object.teacherLanguage = [dic objectForKey:@"kieuhoc"];
        _object.imageLanguage = [dic objectForKey:@"anh"];
        _object.listTeacherLanguage = [dic objectForKey:@"cacbai"];
        [_arrayTeaching addObject:_object];
        NSString * imageLanguage = _object.imageLanguage;
        UIButton *button = [UIButton new];
        button.frame = CGRectMake(50,20+i*100, 90, 80);
        button.tag=i;
        NSLog(@"%d",i);
        [button setImage:[UIImage imageNamed:imageLanguage] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(ListTeach:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *labal=[UILabel new];
        labal.text = [NSString stringWithFormat:@"%@",_object.teacherLanguage];
        labal.frame = CGRectMake(170, 40+i*100, 100, 40);
        [self.view addSubview:button];
        [self.view addSubview:labal];
    }
    
}
-(void)ListTeach:(UIButton*)sender{
    tableView.objectTeach=_arrayTeaching[sender.tag];
    [self.navigationController pushViewController:tableView animated:YES];
}
@end
