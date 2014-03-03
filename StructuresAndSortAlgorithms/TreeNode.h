//
//  TreeNode.h
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (strong, nonatomic) TreeNode *leftNode;
@property (strong, nonatomic) TreeNode *rightNode;
@property (nonatomic) int data;
@property (nonatomic) int depth;

- (id)initWithData:(int)data;

- (void)printNodes;

- (void)printNode;

- (TreeNode *)searchForData:(int)nodeData;

- (void) addNode: (TreeNode*) node;

@end
