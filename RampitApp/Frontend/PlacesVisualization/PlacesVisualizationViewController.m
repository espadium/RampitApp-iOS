//
//  PlacesVisualizationViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 9/18/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "APIServiceManager.h"

#import "PlacesVisualizationViewController.h"

@interface PlacesVisualizationViewController ()

@end

@implementation PlacesVisualizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)fetchPlacesOnSuccess:(void (^)())successHandler
                     onError:(void (^)(NSError *error))errorHandler {
    [[APIServiceManager sharedInstance] getPlacesListWithSuccessHandler:^(NSArray *places) {
        if ([places count] > 0) {
            self.places = places;
            successHandler();
        }
    } onError:^(NSError *error) {
        errorHandler(error);
    }];
}

@end
