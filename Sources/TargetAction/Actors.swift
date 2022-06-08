//
//  Actor.swift
//
//  Copyright © 2022 Doug Russell. All rights reserved.
//

public extension Actor {

    // MARK: - Async

    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target(
        action: @escaping (isolated Self) -> () async -> Void
    ) -> () async -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return await action(self)()
        }
    }
    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target<Input>(
        action: @escaping (isolated Self) -> (Input) async -> Void
    ) -> (Input) async -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return await action(self)(input)
        }
    }
    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target<Input1, Input2>(
        action: @escaping (isolated Self) -> (Input1, Input2) async -> Void
    ) -> (Input1, Input2) async -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return await action(self)(input1, input2)
        }
    }

    // MARK: - Async Throwing

    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target(
        action: @escaping (isolated Self) -> () async throws -> Void
    ) -> () async throws -> Void {
        return { [weak self] in
            guard let self = self else { return }
            return try await action(self)()
        }
    }
    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target<Input>(
        action: @escaping (isolated Self) -> (Input) async throws -> Void
    ) -> (Input) async throws -> Void {
        return { [weak self] input in
            guard let self = self else { return }
            return try await action(self)(input)
        }
    }
    /// Helper function to make a closure from a method on an actor instance without retaining self
    @inlinable
    func target<Input1, Input2>(
        action: @escaping (isolated Self) -> (Input1, Input2) async throws -> Void
    ) -> (Input1, Input2) async throws -> Void {
        return { [weak self] input1, input2 in
            guard let self = self else { return }
            return try await action(self)(input1, input2)
        }
    }
}
