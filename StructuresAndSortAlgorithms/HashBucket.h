//
//  hashBucket.h
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 2/26/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashBucket : NSObject

@property (strong,nonatomic) NSString * key;
@property (strong,nonatomic) id value;
@property (strong,nonatomic) HashBucket * next;

@end
