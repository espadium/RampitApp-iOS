//
//  APIServiceManager.h
//  RampitApp
//
//  Created by Gabriel Osorio on 8/26/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^APIServiceManagerPlacesListSuccessHandler)(NSArray *);
typedef void (^APIServiceManagerErrorHandler)(NSError *);

@interface APIServiceManager : NSObject

#pragma mark - Singleton

+ (instancetype)sharedInstance;

#pragma mark - API Requests

- (void)getPlacesListWithSuccessHandler:(APIServiceManagerPlacesListSuccessHandler)successHandler
                                onError:(APIServiceManagerErrorHandler)errorHandler;

@end
