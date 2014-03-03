//
//  Node.m
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "Node.h"

@implementation Node

- (id)initWithData:(int)data
{
    if (self = [super init]) {
        self.data = data;
        self.next = nil; 
    }
    
    return self;
}


- (void)printNodes
{
    NSLog(@"| %d |->",self.data);
    
    if (self.next) {
        [self.next printNodes];
    }
}

- (void)printNode {
    NSLog(@"| %d |->",self.data);
}


- (Node *)searchForData:(int)nodeData
{
    if (self.next == nil) {
        return nil;
    } else if (self.data == nodeData) {
        return self;
    } else {
        return [self.next searchForData:nodeData];
    }
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%d", self.data];
}


@end
