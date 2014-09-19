//
//  PlacesListTableViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/18/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "PlacesListTableViewController.h"

#import "APIServiceManager.h"
#import "Place.h"

#define kPlacesListCellIdentifier @"placesListCellIdentifier"

@interface PlacesListTableViewController ()

@property (nonatomic, strong) NSArray *places;

@end

@implementation PlacesListTableViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Lugares";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[APIServiceManager sharedInstance] getPlacesListWithSuccessHandler:^(NSArray *places) {
        NSLog(@"Success!");
        if ([places count] > 0) {
            self.places = places;
            [self.tableView reloadData];
        }
    } onError:^(NSError *error) {
        NSLog(@"Error");
    }];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlacesListCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kPlacesListCellIdentifier];
    }
#warning Should use a Place object
    Place *aPlace = self.places[indexPath.row];
    cell.textLabel.text = aPlace.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
