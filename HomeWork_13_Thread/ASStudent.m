
#import "ASStudent.h"

@implementation ASStudent

-(id) initWithName:(NSString*) name {
    self = [super init];
    
    if (self) {
        
        _name  = name;
        //_numberAttempts = 0;
        //_finishTime = 0;
    }
    return self;
}


+(dispatch_queue_t) initQueue {

    static dispatch_queue_t queue;
    static dispatch_once_t task;
  
    dispatch_once (&task, ^{
        queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;

}

-(void) guessAnswer:(NSInteger) randomNumber andRange:(NSRange) range andBlock:(testBlock1) block {

    //dispatch_queue_t queue = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue = [ASStudent initQueue];
    __block NSInteger testVar;

   
    dispatch_async(queue, ^{
        
        double startTimeThread = CACurrentMediaTime();
        testVar = arc4random() % range.length;

        while (testVar != randomNumber) {
           _numberAttempts++;
           testVar = arc4random() % range.length;
        }
    
        dispatch_async(dispatch_get_main_queue(), ^{

   block (_name ,testVar,_finishTime, startTimeThread, _numberAttempts);
        });
    });
}

@end
