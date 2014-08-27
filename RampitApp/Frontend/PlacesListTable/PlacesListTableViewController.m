//
//  PlacesListTableViewController.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/18/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "PlacesListTableViewController.h"
#import "APIServiceManager.h"

#define kPlacesListCellIdentifier @"placesListCellIdentifier"

@interface PlacesListTableViewController ()

@property (nonatomic, strong) NSArray *places;

@end

@implementation PlacesListTableViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Lugares";
    [[APIServiceManager sharedInstance] getPlacesListWithSuccessHandler:^(NSArray *places) {
        NSLog(@"Success!");
        self.places = places;
        [self.tableView reloadData];
    } onError:^(NSError *error) {
        NSLog(@"Error");
    }];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
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
    cell.textLabel.text = self.places[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
