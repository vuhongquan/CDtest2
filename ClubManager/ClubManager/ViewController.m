//
//  ViewController.m
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewController.h"
#import "ViewListClubVC.h"
#import "BangxephangVC.h"
#import "TabBarVC.h"
#import "TableViewListPlayer.h"
#import "TabBarMatchVC.h"
@interface ViewController ()
{
    //NSMutableArray *_arrayObject1;
    UITextField *_search;
    UIButton * _listClub;
    UIButton * _searchClub;
    UIButton * _bangXepHang;
    UIButton * _viewAllPlayer;
    ViewListClubVC *_viewListClubVc;
    DataManager * _plist2;
    TabBarVC *_tabbar;
    TableViewListPlayer *_table;
    TabBarMatchVC *_tabbarVC;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES ];
      _viewListClubVc= [[ViewListClubVC alloc]init];
      _tabbarVC = [[TabBarMatchVC alloc]init];
    _table = [[TableViewListPlayer alloc]init];
    _tabbar = [[TabBarVC alloc]init];
    _arrayObject1 =[NSMutableArray new];
    _plist2 = [DataManager sharedManager];
    
    for (int i=0; i < [_plist2.arrayClub count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:_plist2.arrayClub[i]];
        _object= [Object new];
        _object.anhnen = [dic objectForKey:@"anhnen"];
        _object.groupid = [dic objectForKey:@"groupid"];
        _object.tendoi =[dic objectForKey:@"clubname"];
        _object.diemso = [dic objectForKey:@"diemso"];
        _object.sotranthidau = [dic objectForKey:@"sotranthidau"];
        _object.history =[dic objectForKey:@"history"];
        _object.namsinh =[dic objectForKey:@"birth"];
        _object.anhdoibong=[dic objectForKey:@"anh"];
        _object.thanhtich = [dic objectForKey:@"thanhtich"];
        _object.thanhvien = [dic objectForKey:@"thanhvien"];
        _object.diemthidau = [dic objectForKey:@"diemtrandau"];
        [_arrayObject1 addObject:_object];
    }
    
    self.title = @"Football";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    _search = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 140, 30)];
    [_search setBorderStyle:UITextBorderStyleRoundedRect];
    

    _searchClub = [UIButton new];
    _searchClub.frame = CGRectMake(0, 0, 25,25);
    [_searchClub setImage:[UIImage imageNamed:@"find.png"] forState:UIControlStateNormal];
    [_searchClub addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    
    
	UIBarButtonItem *bar1 = [[UIBarButtonItem alloc]initWithCustomView:_search];
    UIBarButtonItem *bar2 = [[UIBarButtonItem alloc]initWithCustomView:_searchClub];
    self.navigationItem.rightBarButtonItems =@[bar1,bar2];
    _search.delegate = self;
    _listClub =[UIButton new];
    _listClub.frame = CGRectMake(20, 20, 100, 100);
    [_listClub addTarget:self action:@selector(listclub:) forControlEvents:UIControlEventTouchUpInside];
    [_listClub setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
    [self.view addSubview:_listClub];
    _bangXepHang = [UIButton new];
    _bangXepHang.frame = CGRectMake(20, 140, 100, 100);
    [_bangXepHang setImage:[UIImage imageNamed:@"bangxephang"] forState:UIControlStateNormal];
    [_bangXepHang addTarget:self action:@selector(bangxephang:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bangXepHang];
    
    _viewAllPlayer = [UIButton new];
    _viewAllPlayer.frame =CGRectMake(20, 260, 100, 100);
    [_viewAllPlayer setImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_viewAllPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
}
-(void) listclub :(id)sender{
    _viewListClubVc.arrayObject1 = _arrayObject1;
    [self.navigationController pushViewController:_viewListClubVc animated:YES];
}
-(void)bangxephang :(id)sender{
    _tabbarVC.arrayObject = _arrayObject1;
    [self.navigationController pushViewController:_tabbarVC animated:YES];
    }
-(void)search:(UIButton*)sender{
    if ([_search.text isEqualToString:@"mu"]) {
        _tabbar.object = _arrayObject1[0];
        [self.navigationController pushViewController:_tabbar animated:YES];
    }
    if ([_search.text isEqualToString:@"arsenal"]) {
        _tabbar.object = _arrayObject1[1];
        [self.navigationController pushViewController:_tabbar animated:YES];
    }
    if ([_search.text isEqualToString:@"liv"]) {
        _tabbar.object = _arrayObject1[2];
        [self.navigationController pushViewController:_tabbar animated:YES];
    }
    if ([_search.text isEqualToString:@"bacelona"]) {
        _tabbar.object= _arrayObject1[3];
        [self.navigationController pushViewController:_tabbar animated:YES];
    }

}
@end
