//
//  MyLocationManager.h
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2016-02-02.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface MyLocationManager : NSObject

+ (id)sharedManager;

- (void)startLocationMonitoring;

@property (nonatomic) CLLocation *currentLocation;


@end
