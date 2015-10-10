
#import "AppDelegate.h"
#import "ASStudent.h"
#import "ASStudentOperation.h"

typedef void      (^testBlock1)(NSString* ,NSInteger,  double , double , NSInteger);

@interface AppDelegate ()
@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
testBlock1 block = ^(NSString* myName ,NSInteger myTestVar, double myFinishTime, double myStartTimeThread, NSInteger myNumberAttempts) {
    
    myFinishTime = CACurrentMediaTime() - myStartTimeThread;
    NSLog(@"%@ угадал ! Оказывается это число - %li |, За %f секунд | Число попыток = %li ",myName ,(long)myTestVar ,myFinishTime,(long)myNumberAttempts);
    };
    
    ASStudent* stu1 = [[ASStudent alloc] initWithName:@"Jeka  - Student 1"];
    ASStudent* stu2 = [[ASStudent alloc] initWithName:@"Dima  - Student 2"];
    ASStudent* stu3 = [[ASStudent alloc] initWithName:@"Danil - Student 3"];
    ASStudent* stu4 = [[ASStudent alloc] initWithName:@"Misha - Student 4"];
    ASStudent* stu5 = [[ASStudent alloc] initWithName:@"Ura   - Student 5"];
    
    NSArray* arrayForStudent = [NSArray arrayWithObjects:stu1 , stu2 ,stu3,
                                                         stu4 , stu5 , nil];
    
    NSRange    myRange  = NSMakeRange (0, 100);
    NSInteger  var      = arc4random() %  myRange.length;
    NSLog(@" Число бинго это =  %li  \n\n\n\n",(long)var);

    //for (ASStudent* student in arrayForStudent) {
    //    [student guessAnswer:var andRange:myRange andBlock:block];
    //}
    //////
    
    
    
    ASStudentOperation* stud1 = [[ASStudentOperation alloc] initWithName:@"Student 1"];
    ASStudentOperation* stud2 = [[ASStudentOperation alloc] initWithName:@"Student 2"];
    ASStudentOperation* stud3 = [[ASStudentOperation alloc] initWithName:@"Student 3"];
    ASStudentOperation* stud4 = [[ASStudentOperation alloc] initWithName:@"Student 4"];
    ASStudentOperation* stud5 = [[ASStudentOperation alloc] initWithName:@"Student 5"];
    ASStudentOperation* stud6 = [[ASStudentOperation alloc] initWithName:@"Student 6"];
    ASStudentOperation* stud7 = [[ASStudentOperation alloc] initWithName:@"Student 7"];

    NSArray* arrayForNSOperation = [NSArray arrayWithObjects:stud1,stud2,stud3,stud4,stud5,stud6,stud7,nil];
    NSOperationQueue* queue;
    
    queue = [NSOperationQueue new];
    [queue setSuspended:YES];
   

    for(__weak ASStudentOperation * student in arrayForNSOperation)
    {
        [student guessAnswer:var andRange:myRange andBlock:block];
    }
    [queue setSuspended:NO];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to mo
     //from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
