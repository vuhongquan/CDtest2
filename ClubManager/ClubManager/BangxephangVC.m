//
//  BangxephangVC.m
//  ClubManager
//
//  Created by ios12 on 4/16/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "BangxephangVC.h"
#import "InformationClubViewController.h"
@interface BangxephangVC ()
{
    UIImageView *_imageClub;
    DataManager *_plist1;
    UILabel *_labalClub;
    UILabel *_titleClub;
    UILabel *_nameOfClub;
    UILabel *_numberOfMatch;
    UILabel *_matchScore;
    UILabel *_nameTitle;
    UILabel *_numberOfMatchTitle;
    UILabel *_scoreOfMatch;
    InformationClubViewController *informationClub;
}
@end

@implementation BangxephangVC
@synthesize shapeLayer1 = _shapeLayer1;
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
    [super viewWillAppear:YES ];
    [self drawLine];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)drawLine{
    _titleClub = [[UILabel alloc]init];
    _titleClub.backgroundColor = [UIColor clearColor];
    _titleClub.text =[NSString stringWithFormat:@"Stt"];
    _titleClub.frame = CGRectMake(2,5,25,30);
    _titleClub.textAlignment = NSTextAlignmentCenter;
    
    _nameTitle= [[UILabel alloc]init];
    _nameTitle.backgroundColor = [UIColor clearColor];
    _nameTitle.text = @"Ten doi bong";
    _nameTitle.frame = CGRectMake(30,10,170,20);
    _nameTitle.textAlignment = NSTextAlignmentCenter;
    
    _numberOfMatchTitle= [[UILabel alloc]init];
    _numberOfMatchTitle.backgroundColor = [UIColor clearColor];
    _numberOfMatchTitle.text =[NSString stringWithFormat:@"So\ntran"];
    _numberOfMatchTitle.numberOfLines = 2;
    _numberOfMatchTitle.frame = CGRectMake(215,0,30,40);
    _numberOfMatchTitle.textAlignment = NSTextAlignmentCenter;
    
    _scoreOfMatch= [[UILabel alloc]init];
    _scoreOfMatch.backgroundColor = [UIColor clearColor];
    _scoreOfMatch.text =[NSString stringWithFormat:@"Diem\nso"];
    _scoreOfMatch.numberOfLines = 2;
    _scoreOfMatch.frame = CGRectMake(265,0,50,40);
    _scoreOfMatch.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_scoreOfMatch];
    [self.view addSubview:_nameTitle];
    [self.view addSubview:_titleClub];
    [self.view addSubview:_numberOfMatchTitle];
    
    float widthOfView = self.view.bounds.size.width;
    float heightOfView = self.view.bounds.size.height;
    //float xCenter = self.view.bounds.size.width/2;
    //float yCenter = self.view.bounds.size.height/2;
    CGMutablePathRef aPath1;
    aPath1 = CGPathCreateMutable();

    CGPathMoveToPoint(aPath1, nil, 0,0);
    CGPathAddLineToPoint(aPath1, nil, 0,heightOfView);

    CGPathMoveToPoint(aPath1, nil, widthOfView,0);
    CGPathAddLineToPoint(aPath1, nil, widthOfView, heightOfView);

    CGPathMoveToPoint(aPath1, nil, 0, 0);
    CGPathAddLineToPoint(aPath1, nil, widthOfView, 0);
    
    CGPathMoveToPoint(aPath1, nil, 0, heightOfView);
    CGPathAddLineToPoint(aPath1, nil, widthOfView, heightOfView);
    for (int y =40 ; y< heightOfView; y=y+30) {
        CGPathMoveToPoint(aPath1, nil, 0, y);
        CGPathAddLineToPoint(aPath1, nil, widthOfView,y);
    }
    for (int i = 0; i < [_arrObject count]; i++) {
         Object *cellobject= [_arrObject objectAtIndex:i];
        _labalClub = [[UILabel alloc]init];
        _labalClub.backgroundColor = [UIColor clearColor];
        _labalClub.text =[NSString stringWithFormat:@"%@",cellobject.groupid];
        _labalClub.frame = CGRectMake(10,i*30+45,12,20);
        _labalClub.textAlignment = NSTextAlignmentCenter;
        
        _numberOfMatch = [[UILabel alloc]init];
        _numberOfMatch.backgroundColor = [UIColor clearColor];
        _numberOfMatch.text =[NSString stringWithFormat:@"%@",cellobject.sotranthidau];
        _numberOfMatch.frame = CGRectMake(219,i*30+45,20,20);
        _numberOfMatch.textAlignment = NSTextAlignmentCenter;

        _matchScore = [[UILabel alloc]init];
        _matchScore.backgroundColor = [UIColor clearColor];
        _matchScore.text =[NSString stringWithFormat:@"%@",cellobject.diemso];
        _matchScore.frame = CGRectMake(280,i*30+45,20,20);
        _matchScore.textAlignment = NSTextAlignmentCenter;
        
        _imageClub = [[UIImageView alloc]initWithImage:[UIImage imageNamed:cellobject.anhdoibong]];
        _imageClub.frame = CGRectMake(30,i*30+44,25,25);
        
        _nameOfClub= [[UILabel alloc]init];
        _nameOfClub.backgroundColor = [UIColor clearColor];
        _nameOfClub.text =[NSString stringWithFormat:@"%@",cellobject.tendoi];
        _nameOfClub.frame = CGRectMake(40,i*30+45,170,20);
        _nameOfClub.textAlignment = NSTextAlignmentCenter;
        _nameOfClub.tag=i;
        _nameOfClub.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(information:)];
        [_nameOfClub addGestureRecognizer:tapA];
        
        
        [self.view addSubview:_imageClub];
        [self.view addSubview:_matchScore];
        [self.view addSubview:_nameOfClub];
        [self.view addSubview:_labalClub];
        [self.view addSubview:_numberOfMatch];
        
    }
    CGPathMoveToPoint(aPath1, nil, 30,0);
    CGPathAddLineToPoint(aPath1, nil,30,heightOfView);
    CGPathMoveToPoint(aPath1, nil,200,0);
    CGPathAddLineToPoint(aPath1, nil,200,heightOfView);
    CGPathMoveToPoint(aPath1, nil,260,0);
    CGPathAddLineToPoint(aPath1, nil,260,heightOfView);
    if (_shapeLayer1) {
        [self.shapeLayer1 removeFromSuperlayer];
    }
    _shapeLayer1 = [CAShapeLayer layer];
    _shapeLayer1.path = aPath1;
    _shapeLayer1.strokeColor = [[UIColor blackColor] CGColor];
    _shapeLayer1.lineWidth = 1;
	_shapeLayer1.lineCap = kCALineCapRound;
    [self.view.layer insertSublayer:_shapeLayer1 atIndex:0];

}
-(void)information:(UIGestureRecognizer *)gesture{
    UIView *view = gesture.view;
    informationClub = [[InformationClubViewController alloc]initWithNibName:@"InformationClubViewController" bundle:nil];
    informationClub.object = _arrObject[view.tag];
    [self.navigationController pushViewController:informationClub animated:YES];
}
@end
