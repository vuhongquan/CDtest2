//
//  TypeObject.m
//  ObjectManager
//
//  Created by ios12 on 4/10/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TypeObject.h"

@interface TypeObject ()
{
    UIButton * _xethoitrang;
    UIButton * _xethethao;
    UIButton * _xedapdien;
    UILabel * _lbXeThoiTrang;
    UILabel * _lbXeTheThao;
    UILabel * _lbXeDapDien;
}
@end

@implementation TypeObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"Cac loai xe";
    self.view.backgroundColor = [UIColor whiteColor];
    _xedapdien = [UIButton new];
    _xedapdien.frame = CGRectMake(10,10,170, 120);
    [_xedapdien setImage:[UIImage imageNamed:@"anh5.tiff"] forState:UIControlStateNormal];
    [self.view addSubview:_xedapdien];
    _xethethao = [UIButton new];
    _xethethao.frame = CGRectMake(150, 135, 170, 120);
    [_xethethao setImage:[UIImage imageNamed:@"anh15.gif"] forState:UIControlStateNormal];
    [self.view addSubview:_xethethao];
    _xethoitrang = [UIButton new];
    _xethoitrang.frame=CGRectMake(10, 270, 170, 120);
    [_xethoitrang setImage:[UIImage imageNamed:@"anh2.tiff"] forState:UIControlStateNormal];
    [self.view addSubview:_xethoitrang];
    
    
    _lbXeDapDien = [UILabel new];
    _lbXeDapDien.backgroundColor = [UIColor clearColor];
    _lbXeDapDien.text =[NSString stringWithFormat:@"Xe Dap Dien\n-Tien dung\n-Ac Quy ben "];
    _lbXeDapDien.numberOfLines = 4;
    _lbXeDapDien.frame = CGRectMake(200,20, 125, 100);
    _lbXeDapDien.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_lbXeDapDien];
    
    
    _lbXeTheThao = [UILabel new];
    _lbXeTheThao.backgroundColor = [UIColor clearColor];
    _lbXeTheThao.text =[NSString stringWithFormat:@"Xe The Thao\n-Tien dung\n-Khoe\n-ben"];
    _lbXeTheThao.numberOfLines = 4;
    _lbXeTheThao.frame = CGRectMake(10,140, 125, 100);
    _lbXeTheThao.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_lbXeTheThao];
    
    
    _lbXeThoiTrang = [UILabel new];
    _lbXeThoiTrang.backgroundColor = [UIColor clearColor];
    _lbXeThoiTrang.text =[NSString stringWithFormat:@"Xe Thoi Trang\n-Tien dung\n-Mau ma dep"];
    _lbXeThoiTrang.numberOfLines = 4;
    _lbXeThoiTrang.frame = CGRectMake(200,300, 125, 100);
    _lbXeThoiTrang.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_lbXeThoiTrang];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
