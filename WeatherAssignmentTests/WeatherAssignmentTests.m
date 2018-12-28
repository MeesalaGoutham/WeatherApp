//
//  WeatherAssignmentTests.m
//  WeatherAssignmentTests
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

#import "WeatherInfoVC.h"
#import "WANetworkingManager.h"

@interface WeatherAssignmentTests : XCTestCase
@property (nonatomic) WeatherInfoVC *vcToTest;

@end
@interface WeatherInfoVC (Test)
-(BOOL)verifyCity:(NSString *)cityid ;
-(void)getCityWeatherInformation:(NSString *)cityid ;
@end

@interface WANetworkingManager (Test)
- (void)getdataWithID:(NSString *)requstid completionBlock:(WAParsingCompletionBlock)completionBlock;
@end

@implementation WeatherAssignmentTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vcToTest = [[WeatherInfoVC alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testverifyCity{
    
    NSString *cityString = @"ca/san_francisco.json";
    BOOL result = [self.vcToTest verifyCity:cityString];
    XCTAssertTrue(result, "city Information is Avialble We go for get the City Weather Information");
    // XCTAssertFalse(result, @"Unable to find the city Information");
}

- (void)testPerformanceVerifyCity
{
    NSString *cityString = @"ca/san_francisco.json";
    [self measureBlock:^{
        [self.vcToTest verifyCity:cityString];
    }];
}



-(void)testgetCityInformation{
    
    NSString *cityString = @"ca/san_francisco.json";
    [[WANetworkingManager sharedNetworkingManager] getdataWithID:[NSString stringWithFormat:@"%@",cityString] completionBlock:^(id response, NSError *error) {
    }];
}

- (void)testPerformancegetCityInformation{
    [self measureBlock:^{
        NSString *cityString = @"ca/san_francisco.json";
        [[WANetworkingManager sharedNetworkingManager] getdataWithID:[NSString stringWithFormat:@"%@",cityString] completionBlock:^(id response, NSError *error) {
        }];
    }];
 }

-(void)requestDidComplete:(id)response andStatusCode:(id)responseData{
    
    if ([(NSHTTPURLResponse *)response statusCode] == REQUEST_SUCCESS) {
        XCTAssertTrue(true, "REQUEST_SUCCESS");
    }else{
        XCTAssertFalse(false, "REQUEST_FAIL");
    }
}


@end
