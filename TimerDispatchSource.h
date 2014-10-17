//
//  TimerDispatchSource.h
//  timerSource
//
//  Created by xtmac02 on 14-10-17.
//  Copyright (c) 2014年 xtmac02. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, TimerSourceQueueType) {
    TimerSourceQueueTypeMain=1,
};

@interface TimerDispatchSource : NSObject

-(TimerDispatchSource *)initWithQueue:(dispatch_queue_t)queue andTaskBlcok:(dispatch_block_t)blk andInterval:(uint64_t)interval andDelta:(uint64_t)delta andLeeway:(uint64_t)leewary;

-(void)resumeTimerSource;
-(void)suppendTimerSource;
@end
