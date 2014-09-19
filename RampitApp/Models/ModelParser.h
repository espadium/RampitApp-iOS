//
//  ModelParser.h
//  RampitApp
//
//  Created by Gabriel Osorio on 9/2/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Place.h"

@interface ModelParser : NSObject

+ (Place *)parsePlaceFromAPIData:(NSDictionary *)data;

@end
