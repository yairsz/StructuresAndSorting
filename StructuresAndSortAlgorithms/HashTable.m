//
//  HashTable.m
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 2/26/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "HashTable.h"
#import "HashBucket.h"

@implementation HashTable

- (id) initWithSize:(NSInteger)size
{
    if (self = [super init]) {
        _hashArray = [[NSMutableArray alloc] initWithCapacity:size];
        self.count = 0;
    }
    return self;
}

- (NSInteger) hashKey: (NSString *) key
{
    NSInteger hashValue = 0;
    for (NSInteger i = 0; i < key.length; i++) {
        hashValue += [key characterAtIndex:i];
    }
    return hashValue % self.hashArray.count;
}

- (void) setValue:(id)value forKey:(NSString *)key {
    HashBucket * bucket = [[HashBucket alloc] init];
    bucket.value = value;
    bucket.key = key;
    HashBucket * collisionBucket = [self.hashArray objectAtIndex:[self hashKey:key]];
    if (collisionBucket) {
        collisionBucket = [self lastBucket:collisionBucket];
        collisionBucket.next = bucket;
    } else {
        [self.hashArray insertObject:bucket atIndex:[self hashKey:key]];
    }
    self.count ++;
}

- (HashBucket *) lastBucket: (HashBucket *) bucket {
    if (bucket.next) {
        return [self lastBucket:bucket.next];
    } else {
        return bucket;
    }
    
}

- (id) valueForKey:(NSString *)key
{
    HashBucket * bucket = [self.hashArray objectAtIndex:[self hashKey:key]];
    return bucket.value;
}

- (void) removeObjectForkey:(NSString *)key
{
    NSInteger i = [self hashKey:key];
    HashBucket * bucket = [self.hashArray objectAtIndex:i];
    HashBucket * pastBucket = nil;
    while (bucket) {
        if ([key isEqualToString:bucket.key]) {
            if (pastBucket){
                pastBucket.next = bucket.next;
            } else {
                self.hashArray[i] = bucket.next;
            }
            self.count --;
            return;
        } else {
            pastBucket = bucket;
            bucket = bucket.next;
        }
    }
    
    
}




@end
