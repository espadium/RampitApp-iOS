//
//  APIServiceManager.m
//  RampitApp
//
//  Created by Gabriel Osorio on 8/26/14.
//  Copyright (c) 2014 AccesibleUY. All rights reserved.
//

#import "APIServiceManager.h"

#define kAPIServiceManagerBaseURL @"http://localhost:9292"

@interface APIServiceManager () <NSURLSessionDelegate>

@end

@implementation APIServiceManager

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&p, ^{
        _sharedObject = [APIServiceManager new];
    });
    return _sharedObject;
}

#pragma mark - Request Processor

- (void)performRequestForURLString:(NSString *)url
                         onSuccess:(APIServiceManagerPlacesListSuccessHandler)successHandler
                           onError:(APIServiceManagerErrorHandler)errorHandler {

    [self performRequestForURLString:url withParams:@{} onSuccess:successHandler onError:errorHandler];
}

- (void)performRequestForURLString:(NSString *)url
                        withParams:(NSDictionary *)params
                         onSuccess:(APIServiceManagerPlacesListSuccessHandler)successHandler
                           onError:(APIServiceManagerErrorHandler)errorHandler {

    NSURL *fullURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kAPIServiceManagerBaseURL, url]];
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.allowsCellularAccess = NO;
    [sessionConfig setHTTPAdditionalHeaders:@{@"Accept": @"application/json"}];
    sessionConfig.timeoutIntervalForRequest = 30.0;
    sessionConfig.timeoutIntervalForResource = 60.0;
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;

    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];

    NSURLSessionDataTask *requestTask = [session dataTaskWithURL:fullURL
                                               completionHandler:^(NSData *data,
                                                                   NSURLResponse *response,
                                                                   NSError *error) {
                                                   NSArray *places = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                   dispatch_async(dispatch_get_main_queue(), ^{
                                                       successHandler(places);
                                                   });
    }];
    [requestTask resume];
}

#pragma mark - API Requests

- (void)getPlacesListWithSuccessHandler:(APIServiceManagerPlacesListSuccessHandler)successHandler
                                onError:(APIServiceManagerErrorHandler)errorHandler {

#warning Change to define method, replace with real places list API URL
    NSString *url = @"/foo/bar";
    [self performRequestForURLString:url onSuccess:successHandler onError:errorHandler];
}

@end
