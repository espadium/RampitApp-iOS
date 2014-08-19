//
//  PlacesMapViewAnnotation.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/19/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "PlacesMapViewAnnotation.h"

@implementation PlacesMapViewAnnotation

- (id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    if (self) {
        _title = title;
        _coordinate = coordinate;
    }
    return self;
}

@end
