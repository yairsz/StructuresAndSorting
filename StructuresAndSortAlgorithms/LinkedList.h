//
//  LinkedList.h
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject


@property (strong,nonatomic) Node *firstNode;
@property (nonatomic) NSInteger count;


- (void)push:(Node *)node;
- (void) pushList: (LinkedList *) list;

- (void) addNode: (Node *) node;
- (void) addList: (LinkedList *) list;

- (Node *)pop;

- (void)print;

- (Node *)searchForNode:(int)nodeData;

@end
