//
//  KM_NSArray+SafeValues.h
//  TheMovieDB
//
//  Created by Kevin Mindeguia on 03/02/2014.
//  Copyright (c) 2014 iKode Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSArray (NSArray_SafeValues)

- (NSString*)safeStringAtIndex:(NSUInteger)index;
- (NSNumber*)safeNumberAtIndex:(NSUInteger)index;
- (NSDictionary*)safeDictionaryAtIndex:(NSUInteger)index;

@end
