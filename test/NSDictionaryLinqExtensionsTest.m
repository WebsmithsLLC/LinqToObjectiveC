//
//  NSDictionaryLinqExtensionsTest.m
//  LinqToObjectiveC
//
//  Created by Colin Eberhardt on 26/02/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "NSDictionaryLinqExtensionsTest.h"
#import "NSDictionary+LinqExtensions.h"

@implementation NSDictionaryLinqExtensionsTest

- (void)testWhere
{
    NSDictionary* input = @{@"A" : @"Apple",
    @"B" : @"Banana",
    @"C" : @"Carrot",
    @"D" : @"Fish"};
    
    
    NSDictionary* result = [input where:^BOOL(id key, id value) {
        return [key isEqual:[value substringToIndex:1]];
    }];
    
    STAssertEquals(result.allKeys.count, 3U, nil);
    STAssertEqualObjects(result[@"A"], @"Apple", nil);
    STAssertEqualObjects(result[@"B"], @"Banana", nil);
    STAssertEqualObjects(result[@"C"], @"Carrot", nil);
}

- (void)testSelect
{
    NSDictionary* input = @{@"A" : @"Apple",
                    @"B" : @"Banana",
                    @"C" : @"Carrot",
                    @"D" : @"Fish"};
    
    
    NSDictionary* result = [input select:^id(id key, id value) {
        return [NSString stringWithFormat:@"%@, %@", key, [value substringToIndex:1]];
    }];
    
    STAssertEquals(result.allKeys.count, 4U, nil);
    STAssertEqualObjects(result[@"A"], @"A, A", nil);
    STAssertEqualObjects(result[@"B"], @"B, B", nil);
    STAssertEqualObjects(result[@"C"], @"C, C", nil);
    STAssertEqualObjects(result[@"D"], @"D, F", nil);
}


@end
