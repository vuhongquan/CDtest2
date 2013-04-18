//
//  ViewController.m
//  ObjectManager
//
//  Created by ios12 on 4/9/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewController.h"
#import "SuportObject.h"
#import "TypeObject.h"
#import "Object.h"
#import "BicycleObject.h"
#import "InformationBicycle.h"
#import "InformationVC.h"
@interface ViewController ()
{
    UIButton * _buttonA;
    UIButton * _buttonB;
    UITextField *_text;
    UIButton * _buttonC;
    BicycleObject  * _bicycleObject ;
    SuportObject *_suportObject;
    InformationBicycle *_informationBicycle;
    InformationVC *_infomationVC;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
     _suportObject = [[SuportObject alloc]init];
    _informationBicycle = [[InformationBicycle alloc]init];
    _infomationVC = [[InformationVC alloc]init];
    _bicycleObject = [[BicycleObject alloc]init];
     UIImageView* ObjectImage = [[UIImageView alloc] initWithFrame:CGRectMake(35, 250, 250,150)];
    ObjectImage.animationImages =[NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"anh2.tiff"],
                                   [UIImage imageNamed:@"anh3.tiff"],
                                   [UIImage imageNamed:@"anh5.tiff"],
                                   [UIImage imageNamed:@"anh6.tiff"],
                                   [UIImage imageNamed:@"anh7.tiff"],
                                   [UIImage imageNamed:@"anh8.tiff"],
                                   [UIImage imageNamed:@"anh9.gif"],
                                   [UIImage imageNamed:@"anh10.gif"],
                                   [UIImage imageNamed:@"anh11.tiff"],
                                   [UIImage imageNamed:@"xedap3.png"],
                                   [UIImage imageNamed:@"anh15.tiff"],
                                   [UIImage imageNamed:@"anh13.tiff"],
                                   [UIImage imageNamed:@"anh12.tiff"],
                                   [UIImage imageNamed:@"anh14.tiff"],
                                   [UIImage imageNamed:@"anhmu1.tiff"],
                                   [UIImage imageNamed:@"anhmu2.tiff"],
                                   [UIImage imageNamed:@"anhmu3.tiff"],nil];

    ObjectImage.animationDuration = 20;
    // repeat the annimation forever
    ObjectImage.animationRepeatCount = 0;
    // start animating
    [ObjectImage startAnimating];
    // add the animation view to the main window
    [self.view addSubview:ObjectImage];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Manager";
    _buttonA = [UIButton new];
    _buttonA.frame = CGRectMake(20,10, 100,100);
    _buttonA.backgroundColor = [UIColor clearColor];
    [_buttonA addTarget:self action:@selector(createBicycle) forControlEvents:UIControlEventTouchUpInside];
    [_buttonA setImage:[UIImage imageNamed:@"bicycle.png"] forState:UIControlStateNormal];
    [self.view addSubview:_buttonA];
    
    _buttonB = [UIButton new];
    _buttonB.frame = CGRectMake(20,110, 100,80);
    _buttonB.backgroundColor = [UIColor clearColor];
    [_buttonB addTarget:self action:@selector(createSuportObject) forControlEvents:UIControlEventTouchUpInside];
    [_buttonB setImage:[UIImage imageNamed:@"anh.png"] forState:UIControlStateNormal];
    [self.view addSubview:_buttonB];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    
    _buttonC = [UIButton new];
    _buttonC.frame = CGRectMake(0,0,20,20);
    _buttonC.backgroundColor = [UIColor clearColor];
    [_buttonC addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [_buttonC setImage:[UIImage imageNamed:@"find.png"] forState:UIControlStateNormal];
    
    _text= [[UITextField alloc]initWithFrame:CGRectMake(0,0,150,25)];
    [_text setBorderStyle:UITextBorderStyleRoundedRect];
    
    UIBarButtonItem * barbutton = [[UIBarButtonItem alloc]initWithCustomView:_text];
     UIBarButtonItem * barbutton1 = [[UIBarButtonItem alloc]initWithCustomView:_buttonC];
    self.navigationItem.rightBarButtonItems = @[barbutton,barbutton1];
    _text.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void) search:(id)sender{
    //_suportObject.kieumu = self.object.kieuMu;
    if ([_text.text isEqualToString: @"Xe dap dien"] ) {
        _bicycleObject.groupid = @"1";
        [self.navigationController pushViewController:_bicycleObject animated:YES];
    }
    if ([_text.text isEqualToString:@"Xe the thao"]){
        _bicycleObject.groupid = @"3";
        [self.navigationController pushViewController:_bicycleObject animated:YES];
    }
    if ([_text.text isEqualToString:@"Xe thoi trang"]){
        _bicycleObject.groupid = @"2";
        [self.navigationController pushViewController:_bicycleObject animated:YES];
    }
    if ([_text.text isEqualToString:@"Mu bao hiem"]) {
        [self.navigationController pushViewController:_suportObject animated:YES];
   }
    if ([_text.text isEqualToString:self.object.kieuMu]) {
         [self.navigationController pushViewController:_suportObject animated:YES];
    }
    if ([_text.text isEqualToString:self.object.kieuXe]) {
        
        [self.navigationController pushViewController:_infomationVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createSuportObject{
    SuportObject * suport = [[SuportObject alloc]init];
    [self.navigationController pushViewController:suport animated:YES];
}
-(void)createBicycle{
    TypeObject * type = [[TypeObject alloc]init];
    [self.navigationController pushViewController:type animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
