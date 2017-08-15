//
//  Venue.h
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2017-08-15.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Venue : NSObject <MKAnnotation>

    @property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
    @property (nonatomic, readonly, copy, nullable) NSString *title;
    @property (nonatomic, readonly, copy, nullable) NSString *subtitle;
    
    
- (instancetype _Nullable )initWithCoordinate:(CLLocationCoordinate2D)aCoordinate andTitle:(NSString * _Nullable)aTitle andSubtitle:(NSString * _Nullable)aSubtitle;

@end
