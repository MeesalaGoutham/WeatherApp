//
//  WeartherInfo_Model.m
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import "WeartherInfo_Model.h"
#import "NSString+NSVNullHandlers.h"
#import <objc/runtime.h>


//Keys-Weather Information
  NSString *WeatherInfo_current_observation =@"current_observation" ;
  NSString *WeatherInfo_icon_url =@"icon_url" ;
  NSString *WeatherInfo_display_location =@"display_location" ;
  NSString *WeatherInfo_city =@"city" ;
  NSString *WeatherInfo_country =@"country" ;
  NSString *WeatherInfo_dewpoint_c =@"dewpoint_c" ;
  NSString *WeatherInfo_dewpoint_f =@"dewpoint_f" ;
  NSString *WeatherInfo_dewpoint_string =@"dewpoint_string" ;
  NSString *WeatherInfo_latitude =@"latitude" ;
  NSString *WeatherInfo_longitude =@"longitude" ;
  NSString *WeatherInfo_feelslike_c =@"feelslike_c" ;
  NSString *WeatherInfo_feelslike_f =@"feelslike_f" ;
  NSString *WeatherInfo_feelslike_string =@"feelslike_string" ;

@implementation WeartherInfo_Model

- (id) initWithDataFileDict:(NSDictionary *)dict {
    if (self = [super init]) {
        //now parse the data in dictionary.
      self.icon_url = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_icon_url]];
      self.dewpoint_c = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_dewpoint_c]];
      self.dewpoint_f  = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_dewpoint_f]];
      self.dewpoint_string = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_dewpoint_string]];
      self.feelslike_c = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_feelslike_c]];
      self.feelslike_f = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_feelslike_f]];
      self.feelslike_string = [NSString stringWithFormat:@"%@",[dict objectForKeyNotNull:WeatherInfo_feelslike_string]];
      self.display_location = [dict objectForKeyNotNull:WeatherInfo_display_location];
    }
    return self;
}

- (NSMutableDictionary *)dictionaryWithPropertiesOfObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        if([obj valueForKey:key] != nil){
            [dict setObject:[NSString stringWithFormat:@"%@",[obj valueForKey:key]] forKey:key];
        }else{
            [dict setObject:@"" forKey:key];
        }
    }
    free(properties);
    return dict;
}

@end
