//
//  Actor.swift
//
//  Copyright © 2022-2023 Doug Russell. All rights reserved.
//

public extension Actor {

    // MARK: - Async

    /// Make a closure from an instance method on an Actor without introducing a retain cycle.
    ///
    /// This unchecked variant is available for when @Sendable conformance isn't available.
    /// The checked variant is strongly preferred.
    ///
    /// - Parameters:
    ///   - uncheckedAction: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target(
        uncheckedAction: @escaping (isolated Self) -> () async -> Void
    ) -> @Sendable () async -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return await uncheckedAction(self)()
        }
    }
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
    /// This unchecked variant is available for when @Sendable conformance isn't available.
    /// The checked variant is strongly preferred.
    ///
    /// - Parameters:
    ///   - uncheckedAction: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input>(
        uncheckedAction: @escaping (isolated Self) -> (Input) async -> Void
    ) -> (Input) async -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return await uncheckedAction(self)(input)
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
    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target<Input1, Input2>(
        uncheckedAction: @escaping (isolated Self) -> (Input1, Input2) async -> Void
    ) -> @Sendable (Input1, Input2) async -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return await uncheckedAction(self)(input1, input2)
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
    /// This unchecked variant is available for when @Sendable conformance isn't available.
    /// The checked variant is strongly preferred.
    ///
    /// - Parameters:
    ///   - uncheckedAction: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target(
        uncheckedAction: @escaping (isolated Self) -> () async throws -> Void
    ) -> @Sendable () async throws -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return try await uncheckedAction(self)()
        }
    }
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
    /// This unchecked variant is available for when @Sendable conformance isn't available.
    /// The checked variant is strongly preferred.
    ///
    /// - Parameters:
    ///   - uncheckedAction: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input>(
        uncheckedAction: @escaping (isolated Self) -> (Input) async throws -> Void
    ) -> @Sendable (Input) async throws -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return try await uncheckedAction(self)(input)
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
    /// This unchecked variant is available for when @Sendable conformance isn't available.
    /// The checked variant is strongly preferred.
    ///
    /// - Parameters:
    ///   - uncheckedAction: usually an instance method from an Actor taken as a static function that takes the Actor as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with self curried weakly
    @inlinable
    func target<Input1, Input2>(
        uncheckedAction: @escaping (isolated Self) -> (Input1, Input2) async throws -> Void
    ) -> @Sendable (Input1, Input2) async throws -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return try await uncheckedAction(self)(input1, input2)
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
