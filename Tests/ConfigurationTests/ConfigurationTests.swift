import XCTest
@testable import Configuration

class ConfigurationTests: XCTestCase {

    func setEnvironmentVar(name: String, value: String, overwrite: Bool) {
        setenv(name, value, overwrite ? 1 : 0)
    }

    override func setUp() {
        super.setUp()
        setEnvironmentVar(name: "TEST_STRING", value: "TEST_VALUE", overwrite: true)
        setEnvironmentVar(name: "TEST_INT", value: "123", overwrite: true)
        setEnvironmentVar(name: "TEST_DOUBLE", value: "123.456", overwrite: true)
        setEnvironmentVar(name: "TEST_BOOL", value: "true", overwrite: true)

        for (key, value) in ProcessInfo.processInfo.environment {
            print("\(key): \(value)")
        }

    }

    func testStringConfiguration() {

        let stringEnv = Configuration.get("TEST_STRING", defaultValue: "myvalue")
        XCTAssertEqual(stringEnv, "TEST_VALUE")
        XCTAssertNotEqual(stringEnv, "myvalue")

        let stringEnvNotDefined = Configuration.get("TEST_NOT_DEFINED", defaultValue: "defaultvalue")
        XCTAssertNotEqual(stringEnvNotDefined, "TEST_VALUE")
        XCTAssertEqual(stringEnvNotDefined, "defaultvalue")
    }

    func testIntConfiguration() {

        let intEnv = Configuration.get("TEST_INT", defaultValue: 456)
        XCTAssertEqual(intEnv, 123)
        XCTAssertNotEqual(intEnv, 456)

        let intEnvNotDefined = Configuration.get("TEST_INT_NOT_DEFINED", defaultValue: 789)
        XCTAssertNotEqual(intEnvNotDefined, 123)
        XCTAssertEqual(intEnvNotDefined, 789)
    }

    func testDoubleConfiguration() {

        let doubleEnv = Configuration.get("TEST_DOUBLE", defaultValue: 456.123)
        XCTAssertEqual(doubleEnv, 123.456)
        XCTAssertNotEqual(doubleEnv, 456.123)

        let doubleEnvNotDefined = Configuration.get("TEST_BOOL_NOT_DEFINED", defaultValue: 789.123)
        XCTAssertNotEqual(doubleEnvNotDefined, 123.456)
        XCTAssertEqual(doubleEnvNotDefined, 789.123)
    }

    func testBoolConfiguration() {

        let boolEnv = Configuration.get("TEST_BOOL", defaultValue: false)
        XCTAssertTrue(boolEnv)
        XCTAssertNotEqual(boolEnv, false)

        let boolEnvNotDefined = Configuration.get("TEST_BOOL_NOT_DEFINED", defaultValue: false)
        XCTAssertNotEqual(boolEnvNotDefined, true)
        XCTAssertFalse(boolEnvNotDefined)
    }

    static var allTests = [
        ("testStringConfiguration", testStringConfiguration),
        ("testIntConfiguration", testIntConfiguration),
        ("testDoubleConfiguration", testDoubleConfiguration),
        ("testBoolConfiguration", testBoolConfiguration)
    ]
}
