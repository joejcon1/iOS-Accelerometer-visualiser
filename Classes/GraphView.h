//
//  GraphView.h
//  Accelerometer
//
//  Created by Joseph Conway on 28/12/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccelerometerViewController.h"

@interface GraphView : UIView {
	AccelerometerViewController *currentVC;
}

@property(nonatomic, retain)IBOutlet AccelerometerViewController *currentVC;

@end
