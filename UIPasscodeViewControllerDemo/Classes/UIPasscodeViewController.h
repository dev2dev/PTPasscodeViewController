//
//  RootViewController.h
//  UIPasscodeViewControllerDemo
//
//  Created by Lasha Dolidze on 7/7/10.
//  Copyright Picktek LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPasscodePanelCount        3

#define kPasscodePanelWidth        320.0
#define kPasscodePanelHeight       240.0

#define kPasscodeEntryWidth        60.0
#define kPasscodeEntryHeight       60.0

#define kPasscodePanelTitleTag     10
#define kPasscodePanelSummaryTag   11

#define kPasscodeFakeTextField     12

#define kPasscodePanelOne           0.0
#define kPasscodePanelTwo          -320.0
#define kPasscodePanelThree        -640.0


@protocol PasscodeViewControllerDelegate;


@interface UIPasscodeViewController : UITableViewController <UITextFieldDelegate> {
    
    UIView *_scrollView;
    UIView *currentPanel;
    
    id<PasscodeViewControllerDelegate> _delegate;
    
}
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *summaryLabel;

@property (nonatomic, readonly) UIView *currentPanel;
@property (nonatomic,assign) id<PasscodeViewControllerDelegate> delegate;

-(id)initWithDelegate:(id)delegate;
- (void)clearPanel;
-(BOOL)prevPanel;
-(BOOL)nextPanel;
@end


@protocol PasscodeViewControllerDelegate <NSObject>
@optional
- (BOOL)shouldChangePasscode:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView passCode:(NSUInteger)passCode lastNumber:(NSInteger)lastNumber;
- (void)didShowPasscodePanel:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView;
- (BOOL)didEndPasscodeEditing:(UIPasscodeViewController *)passcodeView panelView:(UIView*)panelView passCode:(NSUInteger)passCode;

@end