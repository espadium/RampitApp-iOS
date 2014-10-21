//
//  Place.h
//  RampitApp
//
//  Created by Gabriel Osorio on 9/2/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Place : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end
