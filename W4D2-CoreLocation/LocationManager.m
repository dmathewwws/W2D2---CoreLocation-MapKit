//
//  LocationManager.m
//  W4D2-CoreLocation
//
//  Created by Admin on 2016-09-27.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import "LocationManager.h"
@import UIKit;


@interface LocationManager() <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation LocationManager

+ (id)sharedManager {
    static LocationManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}


- (void)startLocationMonitoring{
    if ([CLLocationManager locationServicesEnabled]) {
        
        if ((!([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted)) || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
            [self setUpLocationManager];
            
        }else{
            
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location services are disabled, Please go into Settings > Privacy > Location to enable them for Play" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //
                
                
            }];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //
                
                
            }];
            
            
            [alertController addAction:ok];
            [alertController addAction:cancel];
            
        }
        
    }
    
}


-(void)setUpLocationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        _locationManager.distanceFilter = 10; //have to move 10m before location manager checks again
        
        _locationManager.delegate = self;
        [_locationManager requestWhenInUseAuthorization];
        NSLog(@"new location Manager in startLocationManager");
        
    }
    
    [_locationManager startUpdatingLocation];
    NSLog(@"Start Regular Location Manager");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
        
        CLLocation * loc = [locations lastObject];
        
        NSLog(@"Time %@, latitude %+.6f, longitude %+.6f currentLocation accuracy %1.2f loc accuracy %1.2f timeinterval %f",[NSDate date],loc.coordinate.latitude, loc.coordinate.longitude, loc.horizontalAccuracy, loc.verticalAccuracy, fabs([loc.timestamp timeIntervalSinceNow]));
        
        NSTimeInterval locationAge = -[loc.timestamp timeIntervalSinceNow];
        if (locationAge > 10.0){
            NSLog(@"locationAge is %1.2f",locationAge);
            return;
        }
        
        if (loc.horizontalAccuracy < 0){
            NSLog(@"loc.horizontalAccuracy is %1.2f",loc.horizontalAccuracy);
            return;
        }
        
        if (self.currentLocation == nil || self.currentLocation.horizontalAccuracy >= loc.horizontalAccuracy){
            
            self.currentLocation = loc;
            [self.delegate passCurrentLocation:self.currentLocation];
            
            if (loc.horizontalAccuracy <= self.locationManager.desiredAccuracy) {
                [self stopLocationManager];
            }
        }
    
    
    
}

-(void)stopLocationManager{
    if ([CLLocationManager locationServicesEnabled]) {
        if (_locationManager) {
            [_locationManager stopUpdatingLocation];
            NSLog(@"Stop Regular Location Manager");
        }
    }
}


@end
