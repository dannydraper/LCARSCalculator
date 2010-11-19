//
//  LCARS_CalculatorAppDelegate.h
//  LCARS Calculator
//
//  Created by Danny Draper on 18/08/2010.
//  Copyright CedeSoft Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCARS_CalculatorViewController;

@interface LCARS_CalculatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LCARS_CalculatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LCARS_CalculatorViewController *viewController;

@end

