//
//  HeapSorter.m
//  LinkedListAndBinarySearchTree
//
//  Created by Yair Szarf on 2/25/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "HeapSorter.h"
#import "SortNode.h"

@implementation HeapSorter

- (NSMutableArray *) sortArray:(NSMutableArray*) array
{
    
    array = [self heapArray:array];
    
    array = [self sortedHeapArray:array];
    
    return array;
}


- (NSMutableArray *) heapArray: (NSMutableArray *) array
{
    
    for (int i = (array.count-1)/2; i >= 0; i--) {
        int leftChildIndex = (i * 2) + 1;
        int rightChildIndex = (i * 2) + 2;
        SortNode * node = [array objectAtIndex:i];
        if (rightChildIndex < array.count) {
            SortNode * rightChild = [array objectAtIndex:rightChildIndex];
            SortNode * leftChild = [array objectAtIndex:leftChildIndex];
            SortNode * largestChild = (rightChild.data > leftChild.data) ? rightChild : leftChild;
            if (largestChild.data > node.data) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:[array indexOfObject:largestChild]];
            }
        }
        
    }
    
    return array;
}

- (NSMutableArray *) sortedHeapArray : (NSMutableArray *) array
{
    NSMutableArray * sortedArray = [NSMutableArray new];
    for (int i = array.count -1; i >= 0; i--) {
        [array exchangeObjectAtIndex:0 withObjectAtIndex:i];
        [sortedArray insertObject:[array lastObject] atIndex:0];
        [array removeLastObject];
        if (array.count) array = [self heapArray:array];
    }
    
    return sortedArray;
}



@end
