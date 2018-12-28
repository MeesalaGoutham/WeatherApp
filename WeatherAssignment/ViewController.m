//
//  ViewController.m
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import "ViewController.h"
#import "WeatherInfoVC.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong,nonatomic)NSMutableArray *cityArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _cityArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"San Francisco, CA" forKey:@"city"];
    [dict setObject:@"ca/san_francisco.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Manhattan, NY" forKey:@"city"];
    [dict setObject:@"ny/manhattan.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    // il/chicago
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Atlanta, GA" forKey:@"city"];
    [dict setObject:@"ga/atlanta.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Boston, MA" forKey:@"city"];
    [dict setObject:@"ma/boston.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Houston, TX" forKey:@"city"];
    [dict setObject:@"tx/houston.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Paris, France " forKey:@"city"];
    [dict setObject:@"fr/paris.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
    
    dict = [NSMutableDictionary dictionary];
    [dict setObject:@"Munich, Germany" forKey:@"city"];
    [dict setObject:@"de/munich.json" forKey:@"tag"];
    [_cityArray addObject:dict];
    dict = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[_cityArray objectAtIndex:indexPath.row] valueForKey:@"city"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeatherInfoVC *wVC =[self.storyboard instantiateViewControllerWithIdentifier:@"WeatherInfoVC"];
    [wVC setCity_id:[[_cityArray objectAtIndex:indexPath.row] valueForKey:@"tag"]];
    [self.navigationController pushViewController:wVC animated:YES];
}

@end
