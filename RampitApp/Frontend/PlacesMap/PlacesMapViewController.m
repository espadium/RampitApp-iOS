//
//  PlacesMapViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/19/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "PlacesMapViewController.h"

#import "APIServiceManager.h"
#import "Place.h"
#import "PlacesMapViewAnnotation.h"

@interface PlacesMapViewController () <MKMapViewDelegate>

// UI Elements
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

// Data
@property (strong, nonatomic) NSArray *places;

@end

@implementation PlacesMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Mapa de Lugares";
    self.mapView.showsUserLocation = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[APIServiceManager sharedInstance] getPlacesListWithSuccessHandler:^(NSArray *places) {
        NSLog(@"Success!");
        if ([places count] > 0) {
            self.places = places;
            [self showPlacesOnMap];
        }
    } onError:^(NSError *error) {
        NSLog(@"Error");
    }];
}


- (void)showPlacesOnMap {
    for (Place *place in self.places) {
        CLLocationCoordinate2D placeCoordinate = CLLocationCoordinate2DMake(place.latitude, place.longitude);
        PlacesMapViewAnnotation *placeAnnotation = [[PlacesMapViewAnnotation alloc] initWithTitle:place.name andCoordinate:placeCoordinate];
        [self.mapView addAnnotation:placeAnnotation];
    }
}

@end
