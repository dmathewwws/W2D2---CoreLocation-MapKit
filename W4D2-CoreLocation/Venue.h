//
//  Venue.h
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2016-02-02.
//  Copyright © 2016 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Venue : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate andTitle:(NSString * _Nullable)aTitle andSubtitle:(NSString * _Nullable)aSubtitle;

@end
