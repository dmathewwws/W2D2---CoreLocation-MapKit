//
//  LocationManager.h
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2017-08-15.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol MyLocationManagerDelegate <NSObject>

-(void) passCurrentLocation: (CLLocation*)location;
    
@end

@interface LocationManager : NSObject
    
+(id)sharedManager;
-(void) startLocationManager;    
@property (nonatomic, weak) id<MyLocationManagerDelegate> delegate;


@end
