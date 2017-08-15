//
//  FoursquareManager.h
//  W4D2-CoreLocation
//
//  Created by Daniel Mathews on 2017-08-15.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface FoursquareManager : NSObject
    
    
    + (void)responseFrom4sq:(CLLocation*)currentLocation categoryId:(NSString*)categoryId limit:(NSString*)limit block:(void (^)(NSArray * , NSError *error))completionBlock;
@end
