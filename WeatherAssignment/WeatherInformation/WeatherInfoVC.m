//
//  WeatherInfoVC.m
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import "WeatherInfoVC.h"
#import "WANetworkingManager.h"
#import "WeartherInfo_Model.h"

@interface WeatherInfoVC ()

@property(nonatomic,weak) IBOutlet UIImageView *img;
@property(nonatomic,weak) IBOutlet UILabel *data_lbl;
@property(nonatomic) WeartherInfo_Model *weather_info;

@end

@implementation WeatherInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self verifyCity:_city_id];
}

-(BOOL)verifyCity:(NSString *)cityid{
    if (cityid.length != 0) {
        [self getCityWeatherInformation:_city_id];
        return true ;
    }else{
        return false;
    }
}

-(void)getCityWeatherInformation:(NSString *)cityid{
    [[WANetworkingManager sharedNetworkingManager] getdataWithID:[NSString stringWithFormat:@"%@",_city_id] completionBlock:^(id response, NSError *error) {
        NSLog(@"response%@",response);
        
        if ([response isKindOfClass:[NSArray class]]) {
            
            NSString *imgurl = [[[response objectAtIndex:0] valueForKey:@"current_observation"] valueForKey:@"icon_url"];
            [self.img setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgurl]]]];
            
        }else if ([response isKindOfClass:[NSDictionary class]]) {
            self.weather_info = [[WeartherInfo_Model alloc] initWithDataFileDict:[response valueForKey:@"current_observation"]];
            
            [self showWeatherInformation];
            
            
        }

    }];
    
}


-(void)showWeatherInformation{
    [self.img setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_weather_info.icon_url]]]];
    
    NSString *str = [NSString stringWithFormat:@"City:%@\nCountry:%@\n\n\nDewPoint C:%@\nDewPoint F:%@\nDewPoint:%@\n\n\nLatitude:%@\nLongitude:%@\n\n\nFeelslike C:%@\nFeelslike F:%@\nFeelslike:%@",[_weather_info.display_location valueForKey:WeatherInfo_city],[_weather_info.display_location valueForKey:WeatherInfo_city],_weather_info.dewpoint_c,_weather_info.dewpoint_f,_weather_info.dewpoint_string,[_weather_info.display_location valueForKey:WeatherInfo_latitude],[_weather_info.display_location valueForKey:WeatherInfo_longitude],_weather_info.feelslike_c,_weather_info.feelslike_f,_weather_info.feelslike_string];
    
    self.data_lbl.text = str;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
