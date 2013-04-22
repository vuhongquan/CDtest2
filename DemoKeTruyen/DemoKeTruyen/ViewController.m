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
}
@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadPhotos
{
    _photoArray = [[NSMutableArray alloc] initWithCapacity:NUM_PHOTOS];
    for (int i = 0; i < NUM_PHOTOS; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        [imageView addGestureRecognizer:swipeRight];
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
    return [NSString stringWithFormat:@"%d - %d", pageIndex, NUM_PHOTOS];
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
        
        //[_transparentView bringSubviewToFront:_pageLabel];
    }];
}

@end
