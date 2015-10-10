
#import "ASStudentOperation.h"

@implementation ASStudentOperation
@synthesize name;

-(id) initWithName:(NSString*) name {
    self = [super init];
    
    if (self) {
        self.name  = name;
        }
    return self;
}


-(void) guessAnswer:(NSInteger) randomNumber andRange:(NSRange) range andBlock:(testBlock1) block {
    
      __block NSInteger testVar;
        double startTimeThread = CACurrentMediaTime();
        testVar = arc4random() % range.length;
        
        while (testVar != randomNumber) {
            _numberAttempts++;
            testVar = arc4random() % range.length;
        }
      block (self.name ,testVar,self.finishTime, startTimeThread, self.numberAttempts);
}

-(void) main {
    NSLog(@" main ");
}
@end
