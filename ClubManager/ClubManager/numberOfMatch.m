//
//  numberOfMatch.m
//  ClubManager
//
//  Created by ios12 on 4/17/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "numberOfMatch.h"

@interface numberOfMatch ()
{
    UILabel *labal;
    UILabel *labal1;
    
    UIImageView *image;
    UIImageView *image1;
    
    UILabel * _scoreClubA;
    UILabel * _scoreClubB;
    
    NSArray * _arrayImage;
    NSMutableArray * _arrayimag1;
}
@end
#define ROW_HEIGHT 90
#define ROW_NUM 10
#define ROW_LABAL 50

@implementation numberOfMatch
@synthesize shapeLayer = _shapeLayer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self createView];
}

- (void)createView
{
    CGRect scrollViewRect = self.view.bounds;
    self.myScrollView1 = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    self.myScrollView1.pagingEnabled = YES;
    [self.view addSubview:self.myScrollView1];
    self.view.backgroundColor = [UIColor whiteColor];
    self.myScrollView1.contentSize = CGSizeMake(scrollViewRect.size.width,ROW_HEIGHT * ROW_NUM);
    
     _arrayimag1 = [NSMutableArray arrayWithArray:_arrayObject];
    CGMutablePathRef aPath1;
    aPath1 = CGPathCreateMutable();
    
    for (int i =0 ; i<self.arrayObject.count;i++) {
        Object *object = [_arrayObject objectAtIndex:i];
        CGPathMoveToPoint(aPath1, nil, 0, (i+1)*70);
        CGPathAddLineToPoint(aPath1, nil, scrollViewRect.size.width,(i+1)*70);
        
        UIImage *imageClub = [UIImage imageNamed:object.anhdoibong];
        image = [[UIImageView alloc]initWithImage:imageClub];
        image.frame = CGRectMake(0,15+i*70, 50,50);
        [self.myScrollView1 addSubview:image];
        
        _scoreClubA = [[UILabel alloc]init];
        _scoreClubA.backgroundColor = [UIColor clearColor];
        _scoreClubA.text = [NSString stringWithFormat:@"%@      -",object.diemthidau];
        _scoreClubA.frame = CGRectMake(120, 20+i*70, 100, 30);
        [self.myScrollView1 addSubview:_scoreClubA];
        


        Object *object1 = [_arrayObject objectAtIndex:3-i];
        
        UIImage *imageClub1 = [UIImage imageNamed:object1.anhdoibong];
        image1 = [[UIImageView alloc]initWithImage:imageClub1];
        image1.frame = CGRectMake(270,15+i*70, 50,50);
        [self.myScrollView1 addSubview:image1];
        
        _scoreClubB = [[UILabel alloc]init];
        _scoreClubB.backgroundColor = [UIColor clearColor];
        _scoreClubB.text = [NSString stringWithFormat:@"    %@",object1.diemthidau];
        _scoreClubB.frame = CGRectMake(180, 20+i*70, 50, 30);
        [self.myScrollView1 addSubview:_scoreClubB];
    }

    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.path = aPath1;
    _shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    _shapeLayer.lineWidth = 1;
	_shapeLayer.lineCap = kCALineCapRound;
    [self.myScrollView1.layer insertSublayer:_shapeLayer atIndex:0];
    
}

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
@end
