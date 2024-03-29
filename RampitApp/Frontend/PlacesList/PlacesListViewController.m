//
//  PlacesListViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/18/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "APIServiceManager.h"
#import "Place.h"
#import "PlaceDetailsTableViewController.h"

#import "PlacesListViewController.h"

#define kPlacesListCellIdentifier @"placesListCellIdentifier"

@interface PlacesListViewController () <UITableViewDataSource, UITableViewDelegate>

// UI Elements
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PlacesListViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Lugares";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchPlaces];
}

- (void)fetchPlaces {
    [super fetchPlacesOnSuccess:^{
        [self.tableView reloadData];
    } onError:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Opa, che..."
                                    message:@"No se pudo acceder al servidor."
                                   delegate:self
                          cancelButtonTitle:@"Cancelar"
                          otherButtonTitles:@"Reintentar", nil]
         show];
    }];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return super.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlacesListCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kPlacesListCellIdentifier];
    }
    Place *aPlace = super.places[indexPath.row];
    cell.textLabel.text = aPlace.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Place *place = self.places[indexPath.row];
    PlaceDetailsTableViewController *detailsViewController = [[PlaceDetailsTableViewController alloc] initWithPlace:place];
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

@end
