//
//  MergeSorter.m
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 3/2/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "MergeSorter.h"
#import "SortNode.h"

@implementation MergeSorter

- (NSMutableArray *) sortArray:(NSMutableArray*) array
{
    NSMutableArray * arrayOfSplitArrays = [self splitArray:array];
    while (arrayOfSplitArrays.count >1) {
        for (NSInteger i = 0; i < ceil(arrayOfSplitArrays.count/2.0); i++) {
            if ((i+1) >= arrayOfSplitArrays.count) continue;
            NSMutableArray * mergedArray = [self mergeArray:arrayOfSplitArrays[i] withArray:arrayOfSplitArrays[i+1]];
            [arrayOfSplitArrays removeObjectsInRange:NSMakeRange(i, 2)];
            [arrayOfSplitArrays addObject:mergedArray];
        }
    }
    
    return arrayOfSplitArrays[0];
}

- (NSMutableArray*) splitArray: (NSMutableArray *) array  {
    NSMutableArray * arrayOfArrays = [NSMutableArray new];
    if (array.count == 1) {
        [arrayOfArrays addObject:array];
        return arrayOfArrays;
    } else {
        NSMutableArray * leftArray = [NSMutableArray arrayWithArray:[array subarrayWithRange:NSMakeRange(0, array.count/2)]];
        NSMutableArray * rightArray = [NSMutableArray arrayWithArray:[array subarrayWithRange:NSMakeRange(array.count/2, ceil(array.count/2.0))]];
        [arrayOfArrays addObjectsFromArray:[self splitArray:leftArray]];
        [arrayOfArrays addObjectsFromArray:[self splitArray:rightArray]];
    }
    return arrayOfArrays;
}

- (NSMutableArray *) mergeArray:(NSMutableArray *) array1 withArray:(NSMutableArray *) array2
{
    NSMutableArray * mergedArray = [NSMutableArray new];
    
    if (array1.count && array2.count) {
        SortNode * node1 = [array1 firstObject];
        SortNode * node2 = [array2 firstObject];
        while (array1.count || array2.count) {
            if (!node1 && array1.count) node1 = [array1 firstObject];
            if (!node2 && array2.count) node2 = [array2 firstObject];
            if (!node1) {
                [mergedArray addObject:[array2 firstObject]];
                [array2 removeObjectAtIndex:0];
                node2 = nil;
            } else if (!node2) {
                [mergedArray addObject:[array1 firstObject]];
                [array1 removeObjectAtIndex:0];
                node1 = nil;
            }else if (node1.data <= node2.data) {
                [mergedArray addObject:[array1 firstObject]];
                [array1 removeObjectAtIndex:0];
                node1 = nil;
            } else if (node2.data < node1.data) {
                [mergedArray addObject:[array2 firstObject]];
                [array2 removeObjectAtIndex:0];
                node2 = nil;
            }
                
        }
    } else if (!array1.count){
        mergedArray = array2;
    } else if (!array2.count) {
        mergedArray = array1;
    }
    return mergedArray;
}


@end
