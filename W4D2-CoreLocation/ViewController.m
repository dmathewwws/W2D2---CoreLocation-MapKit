//
//  ViewController.m
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2016-02-02.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "MyLocationManager.h"
#import <MapKit/MapKit.h>
#import "FoursquareManager.h"

#define zoominMapArea 2100

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void) initiateMap {
    
    MyLocationManager *myLocationManager = [MyLocationManager sharedManager] ;
    NSLog(@"My location in ViewController is %@", myLocationManager.currentLocation);
    
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(myLocationManager.currentLocation.coordinate.latitude, myLocationManager.currentLocation.coordinate.longitude);
    
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
    
    [_mapView setRegion:adjustedRegion animated:YES];
    
    
    [FoursquareManager responseFrom4sq:myLocationManager.currentLocation categoryId:@"4d4b7105d754a06377d81259" limit:@"10" block:^(NSArray *locations, NSError *error) {
        
        //code will execute when response is back form Foursquare
        
        NSLog(@"MyLocation is %@", locations);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mapView addAnnotations:locations];
        });

    }];


}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    
    [self initiateMap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
