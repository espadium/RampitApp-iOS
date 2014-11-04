//
//  PlaceDetailsTableViewController.h
//  RampitApp
//
//  Created by Gabriel Osorio on 10/21/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Place.h"

@interface PlaceDetailsTableViewController : UITableViewController

- (instancetype)initWithPlace:(Place *)place;

@end
