//
//  GraphView.m
//  Accelerometer
//
//  Created by Joseph Conway on 28/12/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GraphView.h"
#define _AXIS_ORIGIN_X 20
#define _AXIS_ORIGIN_Y 145
#define _AXIS_LENGTH_X 460
#define _AXIS_LENGTH_Y -135


@implementation GraphView
@synthesize currentVC;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGFloat green[4] = {0.0f, 1.0f, 0.0f, 1.0f};
	CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
	CGFloat blue[4] = {0.0f, 0.0f, 1.0f, 1.0f};
    CGFloat yellow[4] = {1.0f,1.0f,0.0f,1.0f};
	CGFloat white[4] = {1.0f, 1.0f, 1.0f, 1.0f};
	
	//draw axis
    CGContextSetStrokeColor(c, white);
    CGContextBeginPath(c);
	//top of y axis
    CGContextMoveToPoint(c, _AXIS_ORIGIN_X, _AXIS_ORIGIN_Y+_AXIS_LENGTH_Y);
	//bottom of y axis
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y);
	//origin
	CGContextMoveToPoint(c, _AXIS_ORIGIN_X, _AXIS_ORIGIN_Y);
	//end of x axis
    CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+_AXIS_LENGTH_X, _AXIS_ORIGIN_Y);
	CGContextStrokePath(c);
	
	//draw arrow heads
    CGContextBeginPath(c);
    //Y-Axis up
	CGContextMoveToPoint(c, _AXIS_ORIGIN_X-4, _AXIS_ORIGIN_Y+_AXIS_LENGTH_Y+7);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X, _AXIS_ORIGIN_Y+_AXIS_LENGTH_Y);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+4, _AXIS_ORIGIN_Y+_AXIS_LENGTH_Y+7);
	
	//X-axis right
	CGContextMoveToPoint(c, _AXIS_ORIGIN_X+_AXIS_LENGTH_X-5, _AXIS_ORIGIN_Y-4);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+_AXIS_LENGTH_X, _AXIS_ORIGIN_Y);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+_AXIS_LENGTH_X-5, _AXIS_ORIGIN_Y+4);
	CGContextStrokePath(c);
	
	//y-axis down
	CGContextMoveToPoint(c, _AXIS_ORIGIN_X-4, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y-7);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y);
	CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+4, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y-7);
	CGContextStrokePath(c);
	
	
		
	//plot points
	
	CGContextBeginPath(c);
	CGContextSetStrokeColor(c, red);
	CGContextSetFillColor(c, red);
	
	//X COORDS
	CGContextMoveToPoint(c, 20.0f, _AXIS_ORIGIN_Y);
	for (int i=1; i<[currentVC.plots count]; i++) {
		if ((25+2*i) < _AXIS_LENGTH_X) {
			UIAcceleration *a = [currentVC.plots objectAtIndex:i];
			CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+2*i, _AXIS_ORIGIN_Y - (80*a.x));
		}
	}	
	CGContextStrokePath(c);
	
	//Y COORDINATES
	CGContextBeginPath(c);
	CGContextSetStrokeColor(c, blue);
	CGContextSetFillColor(c, blue);
	
	CGContextMoveToPoint(c, 20.0f, _AXIS_ORIGIN_Y);
	for (int i=1; i<[currentVC.plots count]; i++) {
		if ((25+2*i) < _AXIS_LENGTH_X) {
			UIAcceleration *a = [currentVC.plots objectAtIndex:i];
			CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+2*i, _AXIS_ORIGIN_Y - (80*a.y));
		}
	}	
	CGContextStrokePath(c);
	
	//Z COORDINATES
	CGContextBeginPath(c);
	CGContextSetStrokeColor(c, green);
	CGContextSetFillColor(c, green);
	
	CGContextMoveToPoint(c, 20.0f, _AXIS_ORIGIN_Y);
	for (int i=1; i<[currentVC.plots count]; i++) {
		if ((25+2*i) < _AXIS_LENGTH_X) {
			UIAcceleration *a = [currentVC.plots objectAtIndex:i];
			CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+2*i, _AXIS_ORIGIN_Y - (80*a.z));
		}
	}
	CGContextStrokePath(c);
	
    BOOL drawTotalAcceleration = NO;
    if(drawTotalAcceleration){
        //totals
        CGContextBeginPath(c);
        CGContextSetStrokeColor(c, yellow);
        CGContextSetFillColor(c, yellow);
        double lowPassResults;
        CGContextMoveToPoint(c, 20.0f, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y);
        for (int i=1; i<[currentVC.totals count]; i++) {
            if ((25+2*i) < _AXIS_LENGTH_X) {
                NSNumber *j = (NSNumber *) [currentVC.totals objectAtIndex:i];
                const double ALPHA = 0.1;
                double peakPowerForChannel = pow(10, (100 * j.doubleValue));
                double oldLowPass = lowPassResults;
                peakPowerForChannel = peakPowerForChannel * 50;
                lowPassResults = ALPHA * peakPowerForChannel + (1.0 - ALPHA) * oldLowPass;
                CGContextAddLineToPoint(c, 25+2*i, _AXIS_ORIGIN_Y - (80*j.integerValue));
                //CGContextAddLineToPoint(c, _AXIS_ORIGIN_X+2*i, _AXIS_ORIGIN_Y-_AXIS_LENGTH_Y - lowPassResults);
            }
        }
        CGContextStrokePath(c);

    }
   }


- (void)dealloc {
    [super dealloc];
}


@end
