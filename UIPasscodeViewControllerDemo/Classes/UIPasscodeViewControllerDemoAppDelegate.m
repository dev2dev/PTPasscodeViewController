//
//  UIPasscodeViewControllerDemoAppDelegate.m
//  UIPasscodeViewControllerDemo
//
//  Created by Lasha Dolidze on 7/7/10.
//  Copyright Picktek LLC 2010. All rights reserved.
//

#import "UIPasscodeViewControllerDemoAppDelegate.h"
#import "UIPasscodeViewController.h"


@implementation UIPasscodeViewControllerDemoAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;


#pragma mark -

- (void)dealloc 
{
    [_window release];
    [_navigationController release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:rect];
    [self setWindow:window];
    
    
    UIPasscodeViewController *passcodeViewController = [[UIPasscodeViewController alloc] initWithDelegate:self];
    
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController:passcodeViewController];
    
    [self setNavigationController:navController];
    
    [window addSubview:[navController view]];
    [window makeKeyAndVisible];
    
    [window release];
    [navController release];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void) didShowPasscodePanel:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView
{
    [passcodeView setTitle:@"Set Passcode"];
    
    if([panelView tag] == kPasscodePanelOne) {
       [[passcodeView titleLabel] setText:@"Enter a passcode"];
    }

    if([panelView tag] == kPasscodePanelTwo) {
        [[passcodeView titleLabel] setText:@"Re-enter your passcode"];
    }

    if([panelView tag] == kPasscodePanelThree) {
        [[passcodeView titleLabel] setText:@"Panel 3"];
    }
}

- (BOOL)shouldChangePasscode:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView passCode:(NSUInteger)passCode lastNumber:(NSInteger)lastNumber;
{
    // Clear summary text
    [[passcodeView summaryLabel] setText:@""];

    return TRUE;
}

- (BOOL)didEndPasscodeEditing:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView passCode:(NSUInteger)passCode
{
    
    NSLog(@"END PASSCODE - %d", passCode);
    
    if([panelView tag] == kPasscodePanelOne) {
        _passCode = passCode;
        
/*       
        if(passCode != 1234) {
            [[passcodeView summaryLabel] setText:@"Invalid PIN code"];
            [[passcodeView summaryLabel] setTextColor:[UIColor redColor]];
            [passcodeView clearPanel];
            return FALSE;
        }
 */
        return ![passcodeView nextPanel];
    }

    if([panelView tag] == kPasscodePanelTwo) {
        _retryPassCode = passCode;
        
        if(_retryPassCode != _passCode) {
            [passcodeView prevPanel];
            [[passcodeView summaryLabel] setText:@"Passcode did not match. Try again."];
            return FALSE;
        } else {
            [[passcodeView summaryLabel] setText:@"Good boy !"];    
        }
        
    }
    
  //  return ![passcodeView nextPanel];
    
    return TRUE;
}


@end

