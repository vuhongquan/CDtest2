//
//  ViewController.m
//  DemoKeTruyen
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewController.h"
#define NUM_PHOTOS 8
@interface ViewController ()
{
    NSMutableArray * _photoArray;
    int _currentPageIndex;
    UIView * _transparentView;
    UILabel * _pageLabel;
    NSArray * _arraySound;
    NSTimer *_timer1;
    UILabel *_labal;
    NSInteger count;
    NSTimer *_timer2;
}
@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    [self loadPhotos];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadPhotos
{
    _labal = [[UILabel alloc]init];
    
        NSBundle *mainBundle = [NSBundle mainBundle];
        
        NSString *filePath = [mainBundle pathForResource:@"10"
                                                  ofType:@"mp3"];
        
        NSData   *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSError  *error = nil;
        
        /* Start the audio player */
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                         error:&error];
        
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer play];
        self.audioPlayer.volume = 1;
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(timer) userInfo:nil repeats:NO];

    _timer2 = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(removeTime) userInfo:nil repeats:NO];

    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"PlistTimer" ofType:@"plist"];
    _arraySound = [[NSArray alloc] initWithContentsOfFile:dataPath];
      [NSTimer scheduledTimerWithTimeInterval:[_arraySound[0]integerValue] target:self selector:@selector(handleSwipeLeft:) userInfo:nil repeats:NO];
    _photoArray = [[NSMutableArray alloc] initWithCapacity:NUM_PHOTOS];
    for (int i = 0; i < NUM_PHOTOS; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
        imageView.frame = self.view.bounds;
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.userInteractionEnabled = YES;
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [imageView addGestureRecognizer:swipeLeft];
        
        [_photoArray addObject:imageView];
        
    }
    
    _currentPageIndex = 0;
    _transparentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_transparentView];
    [_transparentView addSubview: _photoArray[_currentPageIndex]];
    
    _pageLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 420, self.view.bounds.size.width, 30)];
    _pageLabel.text = [self pageText: _currentPageIndex];
    _pageLabel.textAlignment = NSTextAlignmentCenter;
    _pageLabel.backgroundColor = [[UIColor alloc] initWithRed:0.1 green:0.1 blue:0.1 alpha:0.5];
    _pageLabel.textColor = [UIColor whiteColor];
    [_photoArray[_currentPageIndex] addSubview:_pageLabel];
    
}
- (NSString *) pageText: (NSInteger) pageIndex
{
    return [NSString stringWithFormat:@"%d - %d", pageIndex+1, NUM_PHOTOS];
}
- (void) handleSwipeLeft: (UISwipeGestureRecognizer *)gesture
{
    //Curl Up - page next
    if (_currentPageIndex == NUM_PHOTOS-1) return;
    
    [UIView transitionWithView:_transparentView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        UILabel *backupLabel = _pageLabel;
        [_pageLabel removeFromSuperview];
        backupLabel.text = [self pageText: _currentPageIndex + 1];
        [_photoArray[_currentPageIndex + 1] addSubview:backupLabel];
        [_transparentView addSubview: _photoArray[_currentPageIndex + 1]];
        [_photoArray[_currentPageIndex] removeFromSuperview];
    } completion:^(BOOL finished){
        _currentPageIndex = _currentPageIndex + 1;
        [NSTimer scheduledTimerWithTimeInterval:[_arraySound[_currentPageIndex]integerValue] target:self selector:@selector(handleSwipeLeft:) userInfo:nil repeats:NO];
    
    }];
}
-(void)timer{
    _labal.text= @"Co Be Quang Khan Do";
    _labal.backgroundColor = [UIColor clearColor];
    _labal.textColor = [UIColor redColor];
    _labal.font= [UIFont systemFontOfSize:25];
    _labal.frame = CGRectMake(25, 10, 300, 50);
    [self.view addSubview:_labal];
}
-(void)removeTime{
    [_labal removeFromSuperview];
}
@end
