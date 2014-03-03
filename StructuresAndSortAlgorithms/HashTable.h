//
//  HashTable.h
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 2/26/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

-(id)initWithSize:(NSInteger)size;
-(id)valueForKey: (NSString *) key;
-(void)setValue:(id)value forKey:(NSString *)key;
-(void)removeObjectForkey:(NSString *)key;

@property (nonatomic) NSUInteger count;
@property (strong,nonatomic) NSMutableArray *hashArray;

@end
