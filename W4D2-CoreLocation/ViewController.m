//
//  ViewController.m
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2016-02-02.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import "FoursquareManager.h"
@import MapKit;

@interface ViewController () <MyLocationManagerDelegate>
    @property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

#define zoominMapArea 2100

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LocationManager *manager = [LocationManager sharedManager];
    manager.delegate = self;
    [manager startLocationManager];
    
    _mapView.showsUserLocation = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)passCurrentLocation:(CLLocation *)location{
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
    
    [_mapView setRegion:adjustedRegion animated:YES];
    
    [FoursquareManager responseFrom4sq:location categoryId:@"4d4b7105d754a06377d81259" limit:@"10" block:^(NSArray *venues, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_mapView addAnnotations:venues];
        });
        
    }];

}

@end
