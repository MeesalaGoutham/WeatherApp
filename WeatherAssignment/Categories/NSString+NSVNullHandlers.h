//
//  NSString+NSVNullHandlers.h
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSVNullHandlers)
- (BOOL)isNotNullString;


@end
@interface NSDictionary (NSVNullHandlers)

- (id) objectForKey:(id)aKey isNull:(BOOL)isNull;
- (id) objectForKeyNotNull:(id)aKey;

@end

@interface NSArray (NSVNullHandlers)

- (id) objectAtIndex:(NSUInteger)index isNull:(BOOL)isNull;
- (id) objectAtIndexNotNull:(NSUInteger)index;

@end
