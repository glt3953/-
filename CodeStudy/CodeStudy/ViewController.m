//
//  ViewController.m
//  CodeStudy
//
//  Created by NingXia on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addCircle];
//    [self queueStudy];
//    [self operationStudy];
//    [self groupStudy];
//    [self barrierStudy];
//    [self semaphoreStudy];
}

- (void)addCircle {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();

    // 设置颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextSetFillColorSpace(context, colorSpace);
    CGColorSpaceRelease(colorSpace);

    // 设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);

    // 创建圆形矢量图形
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];

    // 绘制矢量图形
    CGContextAddPath(context, circlePath.CGPath);
    CGContextFillPath(context);

    // 获取绘制的图像
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    // 显示绘制的图像
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];

}

- (void)queueStudy {
    // 并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);

    // 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);

    // 在并发队列中执行10个任务
    dispatch_async(concurrentQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"Task %d in concurrent queue", i);
        }
    });

    // 在串行队列中执行10个任务
    dispatch_async(serialQueue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"Task %d in serial queue", i);
        }
    });
}

- (void)operationStudy {
    // 创建子线程任务
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1:) object:@"Task1"];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2:) object:@"Task2"];
    NSInvocationOperation *operation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task3:) object:@"Task3"];

    // 创建任务队列并添加任务
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation1]; // 添加任务1
    [queue addOperation:operation2]; // 添加任务2
    [operation2 setQueuePriority:NSOperationQueuePriorityHigh];

    // 设置依赖关系，任务3依赖于任务2完成
    [operation3 addDependency:operation2];
    [queue addOperation:operation3]; // 添加任务3
}

- (void)task1:(NSString *)name {
    NSLog(@"%@", name);
}

- (void)task2:(NSString *)name {
    [NSThread sleepForTimeInterval:2]; // 模拟执行任务3秒
    NSLog(@"%@", name);
}

- (void)task3:(NSString *)name {
    NSLog(@"%@", name);
}

- (void)groupStudy {
    //Dispatch groups:调度组,用于等待一组相关任务完成。可以使用dispatch_group_notify监听组中的任务完成。
    // 执行任务组
    dispatch_group_t group = dispatch_group_create();

    // 异步线程1
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2];  // 模拟执行任务2秒
        NSLog(@"Thread 1 executed");
    });

    // 异步线程2
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:3]; // 模拟执行任务3秒
        NSLog(@"Thread 2 executed");
    });

    // 等待任务组执行完毕并执行回调
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"All tasks completed!");
    });
}

- (void)barrierStudy {
    //Barriers:栅栏,用于将任务分段。当栅栏块中的所有任务完成后,才会继续执行后续任务。
    //队列
    dispatch_queue_t queue = dispatch_queue_create("com.demo.queue", DISPATCH_QUEUE_CONCURRENT);

    // 线程1
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [NSThread sleepForTimeInterval:1]; // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);
        }
    });

    // 线程2
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"2---%@",[NSThread currentThread]);
        }
    });

    // dispatch barrier
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier---%@",[NSThread currentThread]);
    });

    // 线程3
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"3---%@",[NSThread currentThread]);
        }
    });
}

- (void)semaphoreStudy {
    //Semaphores:信号量,用于控制访问共享资源的线程数。
    // 创建信号量,初始值设为0
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    // 线程1
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 等待信号量,阻塞线程1
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"Thread 1 executed");
    });

    // 线程2
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2]; // 延迟2秒
        NSLog(@"Thread 2 executed");
        // 发送信号量,释放线程1
        dispatch_semaphore_signal(semaphore);
    });

    // 等待所有异步任务执行完
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Done!");
    });

//    运行结果:
//    Done!
//    Thread 2 executed
//    Thread 1 executed
}

@end
