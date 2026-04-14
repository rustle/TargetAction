//
//  Actor.swift
//
//  Copyright © 2022-2023 Doug Russell. All rights reserved.
//

public extension Actor {

    // MARK: - Async

    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target(
        action: @escaping @Sendable (isolated Self) -> @Sendable () async -> Void
    ) -> @Sendable () async -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return await action(self)()
        }
    }
    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input>(
        action: @escaping @Sendable (isolated Self) -> @Sendable (Input) async -> Void
    ) -> @Sendable (Input) async -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return await action(self)(input)
        }
    }
    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input1, Input2>(
        action: @escaping @Sendable (isolated Self) -> @Sendable (Input1, Input2) async -> Void
    ) -> @Sendable (Input1, Input2) async -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return await action(self)(input1, input2)
        }
    }

    // MARK: - Async Throwing

    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target(
        action: @escaping @Sendable (isolated Self) -> @Sendable () async throws -> Void
    ) -> @Sendable () async throws -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return try await action(self)()
        }
    }
    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input>(
        action: @escaping @Sendable (isolated Self) -> @Sendable (Input) async throws -> Void
    ) -> @Sendable (Input) async throws -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return try await action(self)(input)
        }
    }
    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - action: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input1, Input2>(
        action: @escaping @Sendable (isolated Self) -> @Sendable (Input1, Input2) async throws -> Void
    ) -> @Sendable (Input1, Input2) async throws -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return try await action(self)(input1, input2)
        }
    }
}
