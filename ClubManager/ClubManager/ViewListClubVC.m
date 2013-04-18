//
//  ViewListClubVC.m
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewListClubVC.h"
#import "Object.h"
#import "TabbarVC.h"
#import "InformationClubViewController.h"
#import "ViewController.h"
#define ROW_HEIGHT 90
#define ROW_NUM 10
#define ROW_LABAL 50
@interface ViewListClubVC ()
{
    DataManager * _plist2;
    UIImageView *_theme;
    TabBarVC *_tabbar;
    ViewController *_vcFirst;
}

@end
int xCoord=120;
int yCoord=10;
int buffer = 10;
@implementation ViewListClubVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    CGRect scrollViewRect = self.view.bounds;
    self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView.pagingEnabled = YES;
    [self.view addSubview:self.myScrollView];
    
//    _arrayObject1 =[NSArray arrayWithArray:_vcFirst.arrayObject1];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width,ROW_HEIGHT * ROW_NUM);
    for (int i=0; i<_arrayObject1.count; i++) {
        //Get club
        Object * clubObject = [_arrayObject1 objectAtIndex:i];
        //Get image name
        NSString * imageName = clubObject.anhdoibong;
        NSString * theme = clubObject.anhnen;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,20+ROW_HEIGHT* i,200,ROW_LABAL)];
        label.text = [NSString stringWithFormat:@"%@\n%@",clubObject.tendoi,clubObject.namsinh];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 2;
        
        UIButton * button=[UIButton new];
        button.contentMode = UIViewContentModeScaleAspectFit;
        button.frame = CGRectMake(xCoord,20+ ROW_HEIGHT*i,90,80);
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        button.tag = i;//index of club
        [button  addTarget:self action:@selector(gotoViewClub:) forControlEvents:UIControlEventTouchUpInside];
        _theme = [[UIImageView alloc]initWithImage:[UIImage imageNamed:theme]];
        _theme.frame =CGRectMake(0,20+ROW_HEIGHT*i,320,80);
        [self.myScrollView addSubview:_theme];
        [self.myScrollView addSubview:button];
        [self.myScrollView addSubview:label];
    }
    

    
}
    // Do any additional setup after loading the view from its nib.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
-(void)gotoViewClub :(UIButton*)sender{
    _tabbar = [[TabBarVC alloc]init];
    _tabbar.object =_arrayObject1[sender.tag];
    [self.navigationController pushViewController:_tabbar animated:YES];
    }
@end
