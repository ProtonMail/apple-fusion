/**
 This method is an alternative for XCTNSPredicateExpectation & XCTWaiter. It uses custom run loop mechanism (based of CFRunLoopRunInMode) and it waits
 until condition is met.

 - parameter timeout: maximum waiting time for the condition
 - parameter condition: condition that has to be met to finish `waitUntil` execution before timeout
 */
public func waitUntil(timeout: TimeInterval, condition: @autoclosure @escaping () -> Bool) {
    RunLoopRunUntil(timeout, condition)
}
