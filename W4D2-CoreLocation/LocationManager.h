//
//  LocationManager.h
//  W4D2-CoreLocation
//
//  Created by Admin on 2016-09-27.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol SharedLocationDelegate <NSObject>

-(void) passCurrentLocation:(CLLocation*) currentLocation;

@end


@interface LocationManager : NSObject

@property (nonatomic) CLLocation *currentLocation;

@property (nonatomic, weak) id<SharedLocationDelegate> delegate;

- (void)startLocationMonitoring;


+ (id)sharedManager;

@end
