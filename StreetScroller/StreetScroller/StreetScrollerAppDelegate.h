/*
     File: StreetScrollerAppDelegate.h
 Abstract: This is the App Delegate that sets up the initial view controller.
  Version: 1.1

 
 */

#import <UIKit/UIKit.h>

@class StreetScrollerViewController;

@interface StreetScrollerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) StreetScrollerViewController *viewController;

@end
