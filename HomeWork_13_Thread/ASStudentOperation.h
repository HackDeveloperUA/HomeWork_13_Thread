

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void  (^testBlock1)(NSString* ,NSInteger,  double , double , NSInteger);

@interface ASStudentOperation : NSOperation

@property (nonatomic , strong) NSString* name;
@property (nonatomic , assign) NSInteger numberAttempts;
@property (nonatomic , assign) double    finishTime;
@property (nonatomic , copy) testBlock1 block;

-(void) guessAnswer:(NSInteger) randomNumber andRange:(NSRange) range andBlock:(testBlock1) block;
-(id) initWithName:(NSString*) name;


@end
