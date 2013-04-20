/*
     File: StreetScrollerViewController.h
 Abstract: This view controller contains an instance of InfiniteScrollView.
  Version: 1.1
 */

#import <UIKit/UIKit.h>

@class InfiniteScrollView;

@interface StreetScrollerViewController : UIViewController {
    IBOutlet InfiniteScrollView *scrollView;
}

@end
