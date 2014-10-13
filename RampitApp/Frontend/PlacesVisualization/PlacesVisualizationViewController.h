//
//  PlacesVisualizationViewController.h
//  RampitApp
//
//  Created by Gabriel Osorio on 9/18/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesVisualizationViewController : UIViewController

@property (strong, nonatomic) NSArray *places;

- (void)fetchPlacesOnSuccess:(void (^)())successHandler
                     onError:(void (^)(NSError *error))errorHandler;

@end
