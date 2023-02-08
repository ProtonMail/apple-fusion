/**
 This method is an alternative for XCTNSPredicateExpectation & XCTWaiter. It uses custom run loop mechanism (based of CFRunLoopRunInMode) and it waits
 until condition is met.

 - parameter timeout: maximum waiting time for the condition
 - parameter condition: condition that has to be met to finish `waitUntil` execution before timeout
 - Returns: `Bool` which determines whether the condition is met or not
 */
@discardableResult
public func waitUntil(timeout: TimeInterval, condition: @autoclosure @escaping () -> Bool) -> Bool {
    RunLoopRunUntil(timeout, condition)
}
