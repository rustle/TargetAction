//
//  TargetAction.swift
//
//  Copyright © 2022-2023 Doug Russell. All rights reserved.
//

public struct TargetAction {

    // MARK: - Sync

    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject>(
        _ target: Target,
        action: @escaping (Target) -> () -> Void
    ) -> () -> Void {
        return { [weak target] in
            guard let target = target else { return }
            return action(target)()
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input>(
        _ target: Target,
        action: @escaping (Target) -> (Input) -> Void
    ) -> (Input) -> Void {
        return { [weak target] input in
            guard let target = target else { return }
            return action(target)(input)
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input1, Input2>(
        _ target: Target,
        action: @escaping (Target) -> (Input1, Input2) -> Void
    ) -> (Input1, Input2) -> Void {
        return { [weak target] input1, input2 in
            guard let target = target else { return }
            return action(target)(input1, input2)
        }
    }

    // MARK: - Sync Throwing

    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject>(
        _ target: Target,
        action: @escaping (Target) -> () throws -> Void
    ) -> () throws -> Void {
        return { [weak target] in
            guard let target = target else { return }
            return try action(target)()
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input>(
        _ target: Target,
        action: @escaping (Target) -> (Input) throws -> Void
    ) -> (Input) throws -> Void {
        return { [weak target] input in
            guard let target = target else { return }
            return try action(target)(input)
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input1, Input2>(
        _ target: Target,
        action: @escaping (Target) -> (Input1, Input2) throws -> Void
    ) -> (Input1, Input2) throws -> Void {
        return { [weak target] input1, input2 in
            guard let target = target else { return }
            return try action(target)(input1, input2)
        }
    }

    // MARK: - Async

    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject>(
        _ target: Target,
        action: @escaping (Target) -> () async -> Void
    ) -> () async -> Void {
        return { [weak target] in
            guard let target = target else { return }
            return await action(target)()
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input>(
        _ target: Target,
        action: @escaping (Target) -> (Input) async -> Void
    ) -> (Input) async -> Void {
        return { [weak target] input in
            guard let target = target else { return }
            return await action(target)(input)
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input1, Input2>(
        _ target: Target,
        action: @escaping (Target) -> (Input1, Input2) async -> Void
    ) -> (Input1, Input2) async -> Void {
        return { [weak target] input1, input2 in
            guard let target = target else { return }
            return await action(target)(input1, input2)
        }
    }

    // MARK: - Async Throwing

    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject>(
        _ target: Target,
        action: @escaping (Target) -> () async throws -> Void
    ) -> () async throws -> Void {
        return { [weak target] in
            guard let target = target else { return }
            return try await action(target)()
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input>(
        _ target: Target,
        action: @escaping (Target) -> (Input) async throws -> Void
    ) -> (Input) async throws -> Void {
        return { [weak target] input in
            guard let target = target else { return }
            return try await action(target)(input)
        }
    }
    /// Make a closure from an instance method on a reference type without introducing a retain cycle.
    ///
    /// - Parameters:
    ///   - target: Instance to be passed to action to resolve the instance method to be invokd. Held weakly.
    ///   - action: Usually an instance method taken as a static function that takes the instance as an argument and returns the instance method.
    /// - Returns: closure matching instance method signature with target curried weakly
    @inlinable
    public static func target<Target: AnyObject, Input1, Input2>(
        _ target: Target,
        action: @escaping (Target) -> (Input1, Input2) async throws -> Void
    ) -> (Input1, Input2) async throws -> Void {
        return { [weak target] input1, input2 in
            guard let target = target else { return }
            return try await action(target)(input1, input2)
        }
    }
}
