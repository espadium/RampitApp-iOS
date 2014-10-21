//
//  ModelParser.m
//  RampitApp
//
//  Created by Gabriel Osorio on 9/2/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "ModelParser.h"

@implementation ModelParser

+ (Place *)parsePlaceFromAPIData:(NSDictionary *)data {
    Place *aPlace = [Place new];
    aPlace.name = data[@"name"];
    aPlace.latitude = [data[@"latitude"] doubleValue];
    aPlace.longitude = [data[@"longitude"] doubleValue];
    return aPlace;
}

@end
