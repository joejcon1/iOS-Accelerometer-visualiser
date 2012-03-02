//
//  AccelerometerAppDelegate.h
//  Accelerometer
//
//  Created by Joseph Conway on 19/06/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccelerometerViewController;

@interface AccelerometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerViewController *viewController;

@end

