//
//  LinkedList.m
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "LinkedList.h"
#

@implementation LinkedList

- (void)push:(Node *)node
{
    if (!self.firstNode) {
        self.firstNode = node;
    } else {
        node.next = self.firstNode;
        self.firstNode = node;
        self.count ++;
    }
    
}

- (void) pushList:(LinkedList *)list
{
    Node * lastNode = [self lastNode:list];

    lastNode.next = self.firstNode;
    self.firstNode = list.firstNode;
    self.count += list.count;
    
}

- (void) addNode: (Node *) node
{
    Node * lastNode = [self lastNode:self];
    if (lastNode) {
        lastNode.next = node;
    } else {
        self.firstNode = node;
    }
    
    self.count ++;
}

- (void) addList: (LinkedList *) list
{
    Node * lastNode = [self lastNode:self];
    lastNode.next = list.firstNode;
    self.count += list.count;
}

- (Node *)pop
{
    Node *poppedNode = self.firstNode;
    self.firstNode = self.firstNode.next;
    poppedNode.next = nil;
    self.count --;
    
    return poppedNode;

}


- (Node*) lastNode: (LinkedList *) list
{
    Node * lastNode;
    lastNode = list.firstNode;
    while (lastNode.next) {
        lastNode = lastNode.next;
    }
    return lastNode;
}

- (void)print
{
    [self.firstNode printNodes];
}

- (Node *)searchForNode:(int)nodeData
{
    return [self.firstNode searchForData:nodeData];
}

- (NSString *) description
{
    NSString * description;
    Node * lastNode;
    lastNode = self.firstNode;
    description = [NSString stringWithFormat:@"-> %@ \n",self.firstNode.description];
    while (lastNode.next) {
        
        description = [description stringByAppendingString:[NSString stringWithFormat:@"-> %@ \n",lastNode.description]];
        lastNode = lastNode.next;
    }
    return description;
}


@end
