//
//  SuportObject.m
//  ObjectManager
//
//  Created by ios12 on 4/9/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "SuportObject.h"
#import "InFormation.h"
#import "Object.h"
@interface SuportObject ()
{
    UIView *_view1;
    UITableView *_tableView;
    NSArray *_arraySuport;
    NSMutableArray *_arrayObject;
}
@end

@implementation SuportObject

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
    self.title = @"CacLoaiMuBaoHiem";
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Suport" ofType:@"plist"];
    _arraySuport = [[NSArray alloc] initWithContentsOfFile:dataPath];
    _arrayObject =[NSMutableArray new];
    
    for (int i = 0; i < [_arraySuport count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:_arraySuport[i]];
        
        Object * object = [Object new];
        object.kieuMu = [dic objectForKey:@"kieumu"];
        object.anh =[UIImage imageNamed:[dic objectForKey:@"anh"]];
        object.thongSo = [dic objectForKey:@"thongso"];
        object.soTien = [[dic objectForKey:@"sotien"] integerValue ];
        [_arrayObject addObject:object];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //3. Assign dataSource and delegate properties of UITableView variables
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
return @"                   Mu Bao Hiem";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 10; //Don't use arbitrary number here. It makes your code unmaintainable
    return [_arraySuport count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *result = nil;
    
    static NSString *TableViewCellIdentifier = @"MyCells";
    result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    
    if (result == nil){
        result = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleValue1
                                         reuseIdentifier:TableViewCellIdentifier];
    }
    
    if (indexPath.section == 0) {
        Object * cellObject = _arrayObject[indexPath.row];
        result.textLabel.text = cellObject.kieuMu;
        result.textLabel.font = [UIFont systemFontOfSize:15];
        [result.imageView setImage:cellObject.anh];
        result.detailTextLabel.text =[NSString stringWithFormat:@"%d VND",cellObject.soTien];
    }
    //[result.imageView setImage:[UIImage imageNamed:[dic objectForKey:_arraySuport]]];
    //result.detailTextLabel.text = [NSString stringWithFormat:@"%@ VND",_arraySuport];
    return result;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InFormation * info = [[InFormation alloc]init];
    Object * newObject = _arrayObject[indexPath.row];
    info.anh =newObject.anh;
    info.kieuMu = newObject.kieuMu;
    info.thongSo = newObject.thongSo;
    info.soTien = newObject.soTien;
    [self.navigationController pushViewController:info animated:YES];
}
@end
