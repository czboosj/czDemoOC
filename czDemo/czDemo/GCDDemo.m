//
//  GCDDemo.m
//  czDemo
//
//  Created by boosj on 2017/12/7.
//  Copyright © 2017年 boosj. All rights reserved.
//

#import "GCDDemo.h"

@implementation GCDDemo


- (void)dispatch_Semap{
    NSArray *array = @[@(1),@(2),@(3)];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            dispatch_semaphore_signal(semaphore);
            NSInteger  type = [obj integerValue];
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [self semaphoreFUNCWithType:type completion:^{
                
                NSLog(@"处理完的type: %d",type);
            }];
            
            NSLog(@"处理完的 %d ",type);
        }];
    });
    
    //---------------
    
    __block dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_queue_create("testBlock", NULL);
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 100; i++) {
            NSLog(@"i的值是:%d",i);
        }
        dispatch_semaphore_signal(sem);
    });
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    for (int j = 0; j < 10; j ++) {
        NSLog(@"j的值是:%d",j);
    }
}
/// 耗时函数
- (void)semaphoreFUNCWithType:(NSInteger )type completion:(void (^)(void)) completion{
    sleep(arc4random_uniform(10));
    if(completion){
        completion();
    }

}

#pragma mark 并发demo
- (void)operationQueue_不依赖{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        
        for (int i = 0; i < 1000; i++) {
            
            NSLog(@"执行并发队列1:%d",i);
        }
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^(){
        
        for (int i = 0; i < 1500; i++) {
            
            NSLog(@"执行并发队列2:%d",i);
        }
    }];
    
    
    [queue addOperation:operation1];
    [queue addOperation:operation2];
}

- (void)operationQueue_依赖{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        
        for (int i = 0; i < 1000; i++) {
            
            NSLog(@"执行并发队列1:%d",i);
        }
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^(){
        
        for (int i = 0; i < 1500; i++) {
            
            NSLog(@"执行并发队列2:%d",i);
        }
    }];
    
    
    
    [operation1 addDependency:operation2];   //添加依赖，operation1要依赖operation2才能继续执行
    
    [queue addOperation:operation1];
    [queue addOperation:operation2];
}
@end
