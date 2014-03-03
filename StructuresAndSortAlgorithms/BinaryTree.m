//
//  BinaryTree.m
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "BinaryTree.h"

@implementation BinaryTree

- (void) addNodeWithValue: (int) value
{
    TreeNode * node = [[TreeNode alloc] initWithData:value];
    if (!self.rootNode) {
        self.rootNode = node;
    } else {
        [self.rootNode addNode:node];
    }
}

- (TreeNode *) searchValue: (int) value{
    return [self.rootNode searchForData:value];
}

- (void) print{
    [self.rootNode printNodes];
    
}


@end
