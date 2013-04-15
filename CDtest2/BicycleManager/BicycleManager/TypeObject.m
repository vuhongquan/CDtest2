//
//  TypeObject.m
//  ObjectManager
//
//  Created by ios12 on 4/10/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TypeObject.h"
#import "BicycleObject.h"
#import "Object.h"
@interface TypeObject ()
{
    UIImageView * imageTheme;
    UIButton * _xethoitrang;
    UIButton * _xethethao;
    UIButton * _xedapdien;
    UILabel * _lbXeThoiTrang;
    UILabel * _lbXeTheThao;
    UILabel * _lbXeDapDien;
    BicycleObject  * _bicycleObject ;
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
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];

    
    _bicycleObject = [[BicycleObject alloc]init];
    self.title = @"Cac loai xe";
    self.view.backgroundColor = [UIColor whiteColor];
    _xedapdien = [UIButton new];
    _xedapdien.frame = CGRectMake(10,10,170, 120);
    [_xedapdien setImage:[UIImage imageNamed:@"anh5.tiff"] forState:UIControlStateNormal];
    [_xedapdien addTarget:self action:@selector(createView1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_xedapdien];
    
    _xethethao = [UIButton new];
    _xethethao.frame = CGRectMake(150, 135, 170, 120);
    [_xethethao setImage:[UIImage imageNamed:@"anh15.gif"] forState:UIControlStateNormal];
    [_xethethao addTarget:self action:@selector(createView3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_xethethao];
    
    _xethoitrang = [UIButton new];
    _xethoitrang.frame=CGRectMake(10, 270, 170, 120);
    [_xethoitrang setImage:[UIImage imageNamed:@"anh2.tiff"] forState:UIControlStateNormal];
    [_xethoitrang addTarget:self action:@selector(createView2:) forControlEvents:UIControlEventTouchUpInside];
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
    _lbXeThoiTrang .backgroundColor = [UIColor clearColor];
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
-(void)createView1:(UIButton *)sender{
    _bicycleObject.groupid = @"1";
    _bicycleObject.loaixe = @"Xe Dap Dien";
    [self.navigationController pushViewController:_bicycleObject animated:YES];
}
-(void)createView3:(UIButton *)sender{
    _bicycleObject.loaixe = @"Xe The Thao";
    _bicycleObject.groupid = @"3";
    [self.navigationController pushViewController:_bicycleObject animated:YES];
}
-(void)createView2:(UIButton *)sender{
    _bicycleObject.loaixe = @"Xe Thoi Trang";
    _bicycleObject.groupid = @"2";
    [self.navigationController pushViewController:_bicycleObject animated:YES];
}
@end
