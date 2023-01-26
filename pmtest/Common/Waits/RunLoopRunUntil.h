@import Foundation;

/// RunLoopRunUntil - Run the current RunLoop until `condition` returns true, at most for `timeout` seconds.
/// The `condition` will be called at intervals, and the RunLoop will be stopped as soon as it returns true.
/// returns `true` if we exited because `condition` returned true, `false` because `timeout` expired.
/// Based on a two blog posts:
/// - https://pspdfkit.com/blog/2016/running-ui-tests-with-ludicrous-speed/
/// - https://bou.io/CTTRunLoopRunUntil.html
BOOL __attribute__((overloadable))RunLoopRunUntil(NSTimeInterval timeout, BOOL(^condition)(void));
