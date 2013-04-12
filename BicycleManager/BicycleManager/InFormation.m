//
//  InFormation.m
//  ObjectManager
//
//  Created by ios12 on 4/9/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "InFormation.h"

@interface InFormation ()
{
    NSArray *_arraySuport;
    
    UILabel *_labelC;
    UILabel *_labelD;
    UIImageView * _image;
    UILabel *  _labelA;
    UILabel *  _labelB;
    UIButton * _datmuahang;
}
@end

@implementation InFormation

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
    [super viewDidLoad];
    self.title = self.kieuMu;
    //3. Assign dataSource and delegate properties of UITableView variables

    {
        self.view.backgroundColor =[UIColor whiteColor];
        [super viewDidLoad];
        _labelC= [[UILabel alloc]initWithFrame:CGRectMake(15,150,200,40)];
        _labelC.text = [NSString stringWithFormat:@"-Gia tien:%d VND",self.soTien];
        _labelC.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_labelC];
        _labelD= [[UILabel alloc]initWithFrame:CGRectMake(15,200,300,30)];
        _labelD.backgroundColor  = [UIColor clearColor];
        _labelD.text =self.thongSo;
        [self.view addSubview:_labelD];
        _image = [[UIImageView alloc]initWithImage:self.anh];
        _image.frame = CGRectMake(25, 10 ,250,150);
        _image.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_image];
        [self.view addSubview:_labelC];
        [self.view addSubview:_labelD];
        
        // Do any additional setup after loading the view.
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
