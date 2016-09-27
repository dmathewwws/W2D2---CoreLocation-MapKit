//
//  ViewController.m
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2016-02-02.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "AppDelegate.h"
#import "LocationManager.h"
#import "FoursquareManager.h"

#define zoominMapArea 2100

@interface ViewController () <MKMapViewDelegate, SharedLocationDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic) BOOL isInitallySetUp;
@property (nonatomic) LocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isInitallySetUp = NO;
    _mapView.showsUserLocation = YES;
    
    self.locationManager = [LocationManager sharedManager];
    self.locationManager.delegate = self;
    [self.locationManager startLocationMonitoring];
    

    
    
}

-(void)passCurrentLocation:(CLLocation *)currentLocation{
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
    
    [_mapView setRegion:adjustedRegion animated:YES];
    
    
    [FoursquareManager responseFrom4sq:currentLocation categoryId:@"4d4b7105d754a06377d81259" limit:@"10" block:^(NSArray *locationsArray, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_mapView addAnnotations:locationsArray];
        });
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
