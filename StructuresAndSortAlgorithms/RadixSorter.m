//
//  RadixSorter.m
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 3/2/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "RadixSorter.h"
#import "LinkedList.h"

#define MOD 10 //this implementation only works in base 10

@interface RadixSorter ()

@property (strong, nonatomic) NSMutableArray * listsArray;

@end

@implementation RadixSorter

- (NSMutableArray *) listsArray {
    if (!_listsArray) {
        _listsArray = [NSMutableArray new];
        for (NSInteger i = 0 ; i < MOD; i++) {
            LinkedList * list = [[LinkedList alloc] init];
            [_listsArray addObject:list];
        }
    }
    return _listsArray;
}

- (NSMutableArray *) sortArray:(NSMutableArray *)array
{
    NSInteger list0Count = 0;
    NSInteger exponent = 1;
    while (list0Count != array.count) {
        [self sortToLists:array usingMod:pow(MOD,exponent)];
        LinkedList * list0 = self.listsArray[0];
        list0Count = list0.count;
        array = [NSMutableArray new];
        for (NSInteger i = 0; i < self.listsArray.count ; i ++) {
            array = [self addList:self.listsArray[i] toArray:array];
        }
        exponent ++;
    }
    
    
    return array;
}

- (void) sortToLists:(NSMutableArray *)array usingMod: (NSInteger) mod {
    
    for (NSInteger i = 0; i < array.count; i++)
    {
        Node * node = array[i];
        NSInteger remainder = node.data % mod;
        NSInteger index = remainder/(mod/10);
        LinkedList * list = self.listsArray[index];
        [list addNode:node];
    }
}

- (NSMutableArray *) addList:(LinkedList *) list toArray: (NSMutableArray *) array
{
    if (list.firstNode){
        while (list.firstNode.next) {
            [array addObject:[list pop]];
        }
        [array addObject:[list pop]];
    }
    return array;
}

@end
