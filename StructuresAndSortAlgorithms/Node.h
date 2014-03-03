//
//  Node.h
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic) int data;
@property (strong,nonatomic) Node *next;

- (id)initWithData:(int)data;

- (void)printNodes;

- (void)printNode;

- (Node *)searchForData:(int)nodeData;

@end
