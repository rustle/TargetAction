//
//  AsyncSequence.swift
//
//  Copyright © 2022-2023 Doug Russell. All rights reserved.
//

extension AsyncSequence {
    /// Yield the results of iterating `self` in a `Task` to an instance method without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: instance to be curried via `uncheckedAction`. Held weakly.
    ///   - priority: Quality of Service/`TaskPriority` for `Task` that iterates `self`
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: `Task` iterating over `self` and yielding result to instance method via `action`.
    @inlinable
    public func target<T: AnyObject>(
        _ target: T,
        priority: TaskPriority? = nil,
        action: @escaping @Sendable (T) -> @Sendable (Element) async -> Void
    ) -> Task<Void, any Error> where Self: Sendable, T: Sendable {
        Task(priority: priority) { [weak target] in
            for try await value in self {
                try Task.checkCancellation()
                guard let target = target else {
                    return
                }
                await action(target)(value)
            }
        }
    }
    /// Yield the results of iterating `self` in a `Task` to an instance method without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: instance of an Actor to be curried via `action`. Held weakly.
    ///   - priority: Quality of Service/`TaskPriority` for `Task` that iterates `self`
    ///   - action: Usually an instance method of an Actor taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: `Task` iterating over `self` and yielding result to instance method via `action`.
    @inlinable
    public func target<T: Actor>(
        _ target: isolated T,
        priority: TaskPriority? = nil,
        action: @escaping @Sendable (isolated T) -> @Sendable (Element) async -> Void
    ) -> Task<Void, any Error> where Self: Sendable {
        Task(priority: priority) { [weak target] in
            for try await value in self {
                try Task.checkCancellation()
                guard let target = target else {
                    return
                }
                await action(target)(value)
            }
        }
    }
    /// Yield the results of iterating `self` in a `Task` to the provided closure.
    ///
    /// - Parameters:
    ///   - priority: Quality of Service/`TaskPriority` for `Task` that iterates `self`
    ///   - receiveValue: The closure to execute on receipt of a value..
    /// - Returns: `Task` iterating over `self` and yielding result to instance method via `action`.
    @inlinable
    public func sink(
        priority: TaskPriority? = nil,
        receiveValue: @escaping @Sendable (Element) async -> Void
    ) -> Task<Void, any Error> where Self: Sendable {
        Task(priority: priority) {
            for try await value in self {
                try Task.checkCancellation()
                await receiveValue(value)
            }
        }
    }
}
