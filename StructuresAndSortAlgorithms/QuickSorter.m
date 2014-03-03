//
//  QuickSorter.m
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 2/25/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "QuickSorter.h"


@implementation QuickSorter

+ (NSMutableArray *) sortArray:(NSMutableArray *)unsortedArray
{
    if (unsortedArray.count <= 1){
    return unsortedArray;
    }
    
    int pivotIndex = arc4random() % unsortedArray.count;
    
    NSMutableArray * smallerArray = [NSMutableArray new];
    NSMutableArray * biggerArray = [NSMutableArray new];
    
    SortNode * pivotNode = (SortNode *) unsortedArray[pivotIndex];
    [unsortedArray removeObjectAtIndex:pivotIndex];
    
    for (int i = 0; i< unsortedArray.count ; i++ ) {
        SortNode * node = unsortedArray[i];
        if (node.data <= pivotNode.data) {
            [smallerArray addObject:node];
        } else {
            [biggerArray addObject:node];
        }
    }
    
    NSMutableArray * sortedArray = [NSMutableArray new];
    sortedArray = [self sortArray:smallerArray];
    [sortedArray addObject:pivotNode];
    [sortedArray addObjectsFromArray:[self sortArray:biggerArray]];
    
    return sortedArray;
}

@end
