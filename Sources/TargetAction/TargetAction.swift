//
//  TargetAction.swift
//
//  Copyright © 2022 Doug Russell. All rights reserved.
//

public struct TargetAction {

    // MARK: - Sync

    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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

    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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

    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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

    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
    /// Helper function to make a closure from a method on a reference type instance without retaining the instance
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
