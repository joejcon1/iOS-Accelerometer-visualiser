//
//  AccelerometerViewController.h
//  Accelerometer
//
//  Created by Joseph Conway on 19/06/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccelerometerViewController : UIViewController <UIAccelerometerDelegate>{
	IBOutlet UILabel *xLabel;
	IBOutlet UILabel *yLabel;
	IBOutlet UILabel *zLabel;
	NSMutableArray *plots;
	NSMutableArray *totals;
}
@property(nonatomic, retain) NSMutableArray *plots;
@property(nonatomic, retain) NSMutableArray *totals;
-(IBAction)screenTouched;
@end

