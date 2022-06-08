import XCTest
@testable import TargetAction

final class TargetActionTests: XCTestCase {
    final class Target {
        private(set) var result: Any?

        func targetActionSync_() {
            result = true
        }
        func targetActionSync(argument: Int) {
            result = argument
        }
        func targetActionSync(
            argument1: Int,
            argument2: Int
        ) {
            result = [argument1, argument2]
        }

        func targetActionSyncThrows_() throws {
            result = true
        }
        func targetActionSyncThrows(argument: Int) throws {
            result = argument
        }
        func targetActionSyncThrows(
            argument1: Int,
            argument2: Int
        ) throws {
            result = [argument1, argument2]
        }

        func targetActionAsync_() async {
            result = true
        }
        func targetActionAsync(argument: Int) async {
            result = argument
        }
        func targetActionAsync(
            argument1: Int,
            argument2: Int
        ) async {
            result = [argument1, argument2]
        }

        func targetActionAsyncThrows_() async throws {
            result = true
        }
        func targetActionAsyncThrows(argument: Int) async throws {
            result = argument
        }
        func targetActionAsyncThrows(
            argument1: Int,
            argument2: Int
        ) async throws {
            result = [argument1, argument2]
        }
    }

    func testTargetActionSyncNoArgument() {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSync_
        )
        action()
        XCTAssertEqual(
            t.result as! Bool,
            true
        )
    }
    func testTargetActionSyncOneArgument() {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSync(argument:)
        )
        action(1)
        XCTAssertEqual(
            t.result as! Int,
            1
        )
    }
    func testTargetActionSyncTwoArguments() {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSync(argument1:argument2:)
        )
        action(1, 2)
        XCTAssertEqual(
            t.result as! [Int],
            [1, 2]
        )
    }

    func testTargetActionSyncThrowsNoArgument() throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSyncThrows_
        )
        try action()
        XCTAssertEqual(
            t.result as! Bool,
            true
        )
    }
    func testTargetActionSyncThrowsOneArgument() throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSyncThrows(argument:)
        )
        try action(1)
        XCTAssertEqual(
            t.result as! Int,
            1
        )
    }
    func testTargetActionSyncThrowsTwoArguments() throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionSyncThrows(argument1:argument2:)
        )
        try action(1, 2)
        XCTAssertEqual(
            t.result as! [Int],
            [1, 2]
        )
    }

    func testTargetActionAsyncNoArgument() async {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsync_
        )
        await action()
        XCTAssertEqual(
            t.result as! Bool,
            true
        )
    }
    func testTargetActionAsyncOneArgument() async {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsync(argument:)
        )
        await action(1)
        XCTAssertEqual(
            t.result as! Int,
            1
        )
    }
    func testTargetActionAsyncTwoArguments() async {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsync(argument1:argument2:)
        )
        await action(1, 2)
        XCTAssertEqual(
            t.result as! [Int],
            [1, 2]
        )
    }

    func testTargetActionAsyncThrowsNoArgument() async throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsyncThrows_
        )
        try await action()
        XCTAssertEqual(
            t.result as! Bool,
            true
        )
    }
    func testTargetActionAsyncThrowsOneArgument() async throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsyncThrows(argument:)
        )
        try await action(1)
        XCTAssertEqual(
            t.result as! Int,
            1
        )
    }
    func testTargetActionAsyncThrowsTwoArguments() async throws {
        let t = Target()
        let action = TargetAction.target(
            t,
            action: Target.targetActionAsyncThrows(argument1:argument2:)
        )
        try await action(1, 2)
        XCTAssertEqual(
            t.result as! [Int],
            [1, 2]
        )
    }
}

final class ActorTargetActionTests: XCTestCase {
    actor Target {
        private(set) var result: Any?

        func targetActionAsync_() async {
            result = true
        }
        func targetActionAsync(argument: Int) async {
            result = argument
        }
        func targetActionAsync(
            argument1: Int,
            argument2: Int
        ) async {
            result = [argument1, argument2]
        }

        func targetActionAsyncThrows_() async throws {
            result = true
        }
        func targetActionAsyncThrows(argument: Int) async throws {
            result = argument
        }
        func targetActionAsyncThrows(
            argument1: Int,
            argument2: Int
        ) async throws {
            result = [argument1, argument2]
        }
    }

    func testTargetActionAsyncNoArgument() async {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsync_)
        await action()
        let result = await t.result as! Bool
        XCTAssertEqual(
            result,
            true
        )
    }
    func testTargetActionAsyncOneArgument() async {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsync(argument:))
        await action(1)
        let result = await t.result as! Int
        XCTAssertEqual(
            result,
            1
        )
    }
    func testTargetActionAsyncTwoArguments() async {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsync(argument1:argument2:))
        await action(1, 2)
        let result = await t.result as! [Int]
        XCTAssertEqual(
            result,
            [1, 2]
        )
    }

    func testTargetActionAsyncThrowsNoArgument() async throws {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsyncThrows_)
        try await action()
        let result = await t.result as! Bool
        XCTAssertEqual(
            result,
            true
        )
    }
    func testTargetActionAsyncThrowsOneArgument() async throws {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsyncThrows(argument:))
        try await action(1)
        let result = await t.result as! Int
        XCTAssertEqual(
            result,
            1
        )
    }
    func testTargetActionAsyncThrowsTwoArguments() async throws {
        let t = Target()
        let action = await t.target(action: Target.targetActionAsyncThrows(argument1:argument2:))
        try await action(1, 2)
        let result = await t.result as! [Int]
        XCTAssertEqual(
            result,
            [1, 2]
        )
    }
}
