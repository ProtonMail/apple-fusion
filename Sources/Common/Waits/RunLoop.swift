//
//  RunLoop.swift
//  fusion
//
//  Created by Mateusz Szklarek on 03.04.23.
//

import Foundation

enum RunLoop {

    /// Run the current RunLoop until `condition` returns true, at most for `timeout` seconds.
    /// The `condition` will be called at intervals, and the RunLoop will be stopped as soon as it returns true.
    /// returns `true` if we exited because `condition` returned true, `false` because `timeout` expired.
    /// Based on a two blog posts:
    /// - https://pspdfkit.com/blog/2016/running-ui-tests-with-ludicrous-speed/
    /// - https://bou.io/CTTRunLoopRunUntil.html
    static func runUntil(timeout: TimeInterval, condition: @escaping () -> Bool) -> Bool {
        var fulfilled: Bool = false

        let beforeWaiting: (CFRunLoopObserver?, CFRunLoopActivity) -> Void = { observer, activity in
            if fulfilled {
                return
            }

            fulfilled = condition()

            if fulfilled {
                CFRunLoopStop(CFRunLoopGetCurrent())
            }
        }
        let observer = CFRunLoopObserverCreateWithHandler(
            nil,
            CFRunLoopActivity.beforeWaiting.rawValue,
            true,
            0,
            beforeWaiting
        )

        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, .defaultMode)
        CFRunLoopRunInMode(.defaultMode, timeout, false)
        CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), observer, .defaultMode)

        /*
         If we haven't fulfilled the condition yet, test one more time before returning. This avoids
         that we fail the test just because we somehow failed to properly poll the condition, e.g. if
         the run loop didn't wake up.
         */
        if (!fulfilled) {
            fulfilled = condition()
        }

        return fulfilled
    }

}
