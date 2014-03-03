//
//  ViewController.m
//  LinkedListAndBinarySearchTree
//
//  Created by Matt Remick on 2/24/14.
//  Copyright (c) 2014 Matt Remick. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
#import "LinkedList.h"
#import "BinaryTree.h"
#import "QuickSorter.h"
#import "HeapSorter.h"
#import "RadixSorter.h"
#import "MergeSorter.h"

@interface ViewController ()

@property (weak,nonatomic) IBOutlet UILabel * heapSortTime;
@property (weak,nonatomic) IBOutlet UILabel * quickSortTime;
@property (weak,nonatomic) IBOutlet UILabel * mergeSortTime;
@property (weak,nonatomic) IBOutlet UILabel * radixSortTime;

@property (nonatomic) NSInteger numberOfItems;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self linkedList];
//    [self binaryTree];
}


- (IBAction) itemNumberPressed:(UIButton *)sender
{
    self.numberOfItems = [sender.titleLabel.text integerValue];
    [self quickSort];
    [self heapSort];
    [self radixSort];
    [self mergeSort];
}

- (void) linkedList
{
    
    LinkedList *list = [[LinkedList alloc] init];
    
    
    for (int i = 0; i < 20; i++) {
        Node *node = [[Node alloc] initWithData:i];
        [list push:node];
        
    }
    
    
    
    [list print];
    
    Node *returnedNode = [list searchForNode:12];
    [returnedNode printNode];
}

     
- (void) binaryTree
{
    BinaryTree * tree = [[BinaryTree alloc] init];
    
    for (int i = 0; i < 20; i++) {
        [tree addNodeWithValue: arc4random() % 20];
    }
    
    [tree print];
    
    NSLog(@"Search Result:\n");
    TreeNode *returnedNode = [tree searchValue:5];
    [returnedNode printNode];
}

- (void) quickSort
{
    NSMutableArray * unsortedArray = [NSMutableArray new];
    for (int i = 0; i < self.numberOfItems; i++) {
        SortNode * node = [SortNode new];
        node.data = arc4random() % self.numberOfItems;
        [unsortedArray addObject:node];
    }
    
//    NSLog(@"%@", unsortedArray);
    NSDate * before = [NSDate date];
    NSMutableArray * sortedArray = [QuickSorter sortArray:unsortedArray];
    NSDate * after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    self.quickSortTime.text = [NSString stringWithFormat:@"%f", interval];
    NSLog(@"Quick Sorted%@ \n\n count: %d", sortedArray, sortedArray.count);
}


- (void) heapSort
{
    NSMutableArray * unsortedArray = [NSMutableArray new];
    for (int i = 0; i < self.numberOfItems; i++) {
        SortNode * node = [SortNode new];
        node.data = arc4random() % self.numberOfItems;
        [unsortedArray addObject:node];
    }
    
//    NSLog(@"%@", unsortedArray);
    
    HeapSorter * heapSorter = [HeapSorter new];
    
    NSDate * before = [NSDate date];

    
    NSMutableArray * sortedArray = [heapSorter sortArray:unsortedArray];
    NSDate * after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    self.heapSortTime.text = [NSString stringWithFormat:@"%f", interval];
    
    NSLog(@"Heap Sorted %@ \n\n count: %d", sortedArray, sortedArray.count);
}

- (void) radixSort
{
    NSMutableArray * unsortedArray = [NSMutableArray new];
    for (int i = 0; i < self.numberOfItems; i++) {
        Node * node = [Node new];
        node.data = arc4random() % self.numberOfItems;
        [unsortedArray addObject:node];
    }
    
//    NSLog(@"%@", unsortedArray);
    
    RadixSorter * radixSorter = [RadixSorter new];
    NSDate * before = [NSDate date];

    NSMutableArray * sortedArray = [radixSorter sortArray:unsortedArray];
    NSDate * after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    self.radixSortTime.text = [NSString stringWithFormat:@"%f", interval];
    
    NSLog(@"Radix Sorted: %@ \n\n count: %d", sortedArray, sortedArray.count);
}

- (void) mergeSort
{
    NSMutableArray * unsortedArray = [NSMutableArray new];
    for (int i = 0; i < self.numberOfItems; i++) {
        SortNode * node = [SortNode new];
        node.data = arc4random() % self.numberOfItems;
        [unsortedArray addObject:node];
    }
    
//    NSLog(@"%@", unsortedArray);
    
    MergeSorter * mergeSorter = [MergeSorter new];
    NSDate * before = [NSDate date];

    NSMutableArray * sortedArray = [mergeSorter sortArray:unsortedArray];
    NSDate * after = [NSDate date];
    NSTimeInterval interval = [after timeIntervalSinceDate:before];
    self.mergeSortTime.text = [NSString stringWithFormat:@"%f", interval];
    NSLog(@"Merge Sorted: %@ \n\n count: %d", sortedArray, sortedArray.count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
