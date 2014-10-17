//
//  TimerDispatchSource.m
//  timerSource
//
//  Created by xtmac02 on 14-10-17.
//  Copyright (c) 2014年 xtmac02. All rights reserved.
//

#import "TimerDispatchSource.h"

@implementation TimerDispatchSource
{
    dispatch_block_t _block;
    dispatch_source_t _timer;
    dispatch_time_t _sourceTime;
    uint64_t       _leeway;
    uint64_t       _interval;
    
    BOOL isSetup;
}
-(TimerDispatchSource *)initWithQueue:(dispatch_queue_t)queue andTaskBlcok:(dispatch_block_t)blk andInterval:(uint64_t)interval andDelta:(uint64_t)delta andLeeway:(uint64_t)leewary{
    self=[super init];
    if (self) {
        
        isSetup=NO;
        _block=blk;
        _sourceTime=dispatch_walltime(NULL, 0);

        _interval=interval;
        _leeway=leewary;
        
        _timer=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer, _sourceTime, _interval, _leeway);
        dispatch_source_set_event_handler(_timer, _block);
        
    }
    return self;
}

-(void)resumeTimerSource{
    if (!isSetup) {
        dispatch_resume(_timer);
        isSetup=YES;
    }
}
-(void)suppendTimerSource{
    if (isSetup) {
        dispatch_suspend(_timer);
        isSetup=NO;
    }
}
@end
