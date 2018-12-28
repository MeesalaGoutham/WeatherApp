//
//  WeartherInfo_Model.h
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import <Foundation/Foundation.h>

//Keys-Weather Information
extern  NSString *WeatherInfo_current_observation ;
extern  NSString *WeatherInfo_icon_url ;
extern  NSString *WeatherInfo_display_location ;
extern  NSString *WeatherInfo_city ;
extern  NSString *WeatherInfo_country ;
extern  NSString *WeatherInfo_dewpoint_c ;
extern  NSString *WeatherInfo_dewpoint_f ;
extern  NSString *WeatherInfo_dewpoint_string ;
extern  NSString *WeatherInfo_latitude ;
extern  NSString *WeatherInfo_longitude ;
extern  NSString *WeatherInfo_feelslike_c ;
extern  NSString *WeatherInfo_feelslike_f ;
extern  NSString *WeatherInfo_feelslike_string ;


@interface WeartherInfo_Model : NSObject
@property (nonatomic, strong, readwrite)  id display_location ;
@property (nonatomic, strong, readwrite)  NSString *icon_url ;
@property (nonatomic, strong, readwrite)  NSString *dewpoint_c  ;
@property (nonatomic, strong, readwrite)  NSString *dewpoint_f ;
@property (nonatomic, strong, readwrite)  NSString *dewpoint_string  ;
@property (nonatomic, strong, readwrite)  NSString *feelslike_c ;
@property (nonatomic, strong, readwrite)  NSString *feelslike_f ;
@property (nonatomic, strong, readwrite)  NSString *feelslike_string ;

- (id) initWithDataFileDict:(NSDictionary *)dict;
- (NSMutableDictionary *) dictionaryWithPropertiesOfObject:(id)obj ;






@end
