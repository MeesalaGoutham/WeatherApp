//
//  NSString+NSVNullHandlers.m
//  WeatherAssignment
//
//  Created by Goutham on 5/2/18.
//  Copyright © 2018 Goutham. All rights reserved.
//

#import "NSString+NSVNullHandlers.h"

@implementation NSString (NSVNullHandlers)

- (BOOL)isNotNullString {
    if (self == (id)[NSNull null] || self.length == 0 ){
        return NO;
    }
    return YES;
}

@end

@implementation NSDictionary (NSVNullHandlers)

- (id) objectForKey:(id)aKey isNull:(BOOL)isNull {
    id val = [self objectForKey:aKey];
    if (!isNull) {
        if ([val isKindOfClass:[NSNull class]]) {
            return nil;
        } else {
            return val;
        }
    }
    return val;
}

- (id) objectForKeyNotNull:(id)aKey {
    return [self objectForKey:aKey isNull:NO];
}

@end

@implementation NSArray (NSVNullHandlers)

- (id) objectAtIndex:(NSUInteger)index isNull:(BOOL)isNull {
    id val = [self objectAtIndex:index];
    if (!isNull) {
        if ([val isKindOfClass:[NSNull class]]) {
            return nil;
        } else {
            return val;
        }
    }
    return val;
}

- (id) objectAtIndexNotNull:(NSUInteger)index {
    return [self objectAtIndex:index isNull:NO];
}

@end
