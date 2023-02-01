#import "RunLoopRunUntil.h"

BOOL __attribute__((overloadable))RunLoopRunUntil(NSTimeInterval timeout, BOOL(^condition)(void))
{
    __block BOOL fulfilled = NO;

    void (^beforeWaiting) (CFRunLoopObserverRef observer, CFRunLoopActivity activity) = ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        // Exit `beforeWaiting` block when condition is fulfilled
        if (fulfilled) return;

        // Check the condition
        fulfilled = condition();

        // Condition fulfilled: stop RunLoop now
        if (fulfilled) CFRunLoopStop(CFRunLoopGetCurrent());
    };

    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(NULL, kCFRunLoopBeforeWaiting, true, 0, beforeWaiting);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);

    CFRunLoopRunInMode(kCFRunLoopDefaultMode, timeout, false);

    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    CFRelease(observer);

    // If we haven't fulfilled the condition yet, test one more time before returning. This avoids
    // that we fail the test just because we somehow failed to properly poll the condition, e.g. if
    // the run loop didn't wake up.
    if (!fulfilled) {
        fulfilled = condition();
    }

    return fulfilled;
}
