//
//  PlacesMapViewAnnotation.h
//  RampitApp
//
//  Created by Gabriel Osorio on 8/19/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PlacesMapViewAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate;

@end
