//
//  PlacesMapViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/19/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "PlacesMapViewController.h"
#import "PlacesMapViewAnnotation.h"

@interface PlacesMapViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation PlacesMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Mapa de Lugares";
    self.mapView.showsUserLocation = YES;
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-34.906483, -56.199754);
    PlacesMapViewAnnotation *dummyAnnotation = [[PlacesMapViewAnnotation alloc] initWithTitle:@"Your Location" andCoordinate:coordinate];
    [self.mapView addAnnotation:dummyAnnotation];
}

@end
