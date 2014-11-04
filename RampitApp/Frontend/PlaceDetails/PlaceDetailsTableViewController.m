//
//  PlaceDetailsTableViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 10/21/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "PlacesMapViewAnnotation.h"

#import "PlaceDetailsTableViewController.h"

#define kPlaceDetailsCellIdentifier @"placesDetailsCellIdentifier"
#define kBusinessDetailMapHeight 160

@interface PlaceDetailsTableViewController () <MKMapViewDelegate>

@property (nonatomic, strong) Place *place;
@property (nonatomic, strong) MKMapView *headerMap;

@end

@implementation PlaceDetailsTableViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.place.name;
    [self setupHeaderMap];
}

- (instancetype)initWithPlace:(Place *)place {
    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self) {
        _place = place;
    }

    return self;
}

#pragma mark - Header Map

- (void)setupHeaderMap {
    CGRect mapFrame = CGRectMake(0, 0, self.view.bounds.size.width, kBusinessDetailMapHeight);
    self.headerMap = [[MKMapView alloc] initWithFrame:mapFrame];
    self.headerMap.delegate = self;
    self.headerMap.userInteractionEnabled = NO;
    CLLocationCoordinate2D placeCoordinate = CLLocationCoordinate2DMake(self.place.latitude, self.place.longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(placeCoordinate, span);
    [self.headerMap setRegion:region];
    PlacesMapViewAnnotation *annotation = [[PlacesMapViewAnnotation alloc] initWithTitle:self.place.name andCoordinate:placeCoordinate];
    [self.headerMap addAnnotation:annotation];
    self.tableView.tableHeaderView = self.headerMap;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlaceDetailsCellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:kPlaceDetailsCellIdentifier];
    }

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name";
            cell.detailTextLabel.text = self.place.name;
            break;
        case 1:
            cell.textLabel.text = @"Latitude";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.place.latitude];
            break;
        case 2:
            cell.textLabel.text = @"Longitude";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.place.longitude];
            break;
        default:
            break;
    }

    return cell;
}

@end
