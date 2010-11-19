//
//  PTPasscodeViewControllerDemoAppDelegate.h
//  PTPasscodeViewControllerDemo
//
//  Created by Lasha Dolidze on 7/7/10.
//  Copyright Picktek LLC 2010. All rights reserved.
//  Distributed under GPL license v 2.x or later	 	
//  http://www.gnu.org/licenses/gpl-2.0.html
//

#import <UIKit/UIKit.h>
#import "PTPasscodeViewController.h"

@interface PTPasscodeViewControllerDemoAppDelegate : NSObject <UIApplicationDelegate,PTPasscodeViewControllerDelegate> {
    
    UIWindow *_window;
    UINavigationController *_navigationController;
    
    NSInteger _passCode;
    NSInteger _retryPassCode;
    
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

