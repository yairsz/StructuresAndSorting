//
//  BinaryTree.h
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@interface BinaryTree : NSObject

@property (strong, nonatomic) TreeNode *rootNode;

- (TreeNode *) searchValue: (int) value;

- (void) addNodeWithValue: (int) value;

- (void) print;

@end
