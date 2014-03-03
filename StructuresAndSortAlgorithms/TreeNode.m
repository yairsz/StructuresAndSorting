//
//  TreeNode.m
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (id)initWithData:(int)data
{
    if (self = [super init]) {
        self.data = data;
        self.rightNode = nil;
        self.leftNode = nil;
    }
    
    return self;
}

- (void)printNodes
{
    
    if (self.leftNode) {
        [self.leftNode printNodes];
    }
    
    if (self.rightNode) {
        [self.rightNode printNodes];
    }
    [self printNode];
}

- (void)printNode
{
    NSMutableString * depthString = [NSMutableString new];
    
    for ( int i = 0; i < self.depth; i++) {
        [depthString appendString:@"-"];
    }
        
    NSLog(@"%@| %d |", depthString,self.data);
}

- (TreeNode *)searchForData:(int)nodeData
{
    if (nodeData == self.data) {
        return self;
    } else if (nodeData > self.data) {
        if (self.rightNode) {
            return [self.rightNode searchForData:nodeData];
        } else {
            return nil;
        }
        
    } else if (nodeData < self.data) {
        if (self.leftNode) {
            return [self.leftNode searchForData:nodeData];
        } else {
            return nil;
        }
    }else {
        return nil;
    }
}

- (void) addNode: (TreeNode*) node
{
    node.depth ++;
    if (node.data < self.data) {
        if (self.leftNode) {
            [self.leftNode addNode:node];
        } else {
            self.leftNode = node;
        }
    } else if (node.data > self.data) {
        if (self.rightNode) {
            [self.rightNode addNode:node];
        } else {
            self.rightNode = node;
        }
    } else if (node.data == self.data){
        return;
    }
}

@end
