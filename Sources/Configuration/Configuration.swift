import Foundation

public class Configuration {

    public static func get(_ key: String, defaultValue: String) -> String {
        guard let value = ProcessInfo.processInfo.environment[key] else {
            return defaultValue
        }
        return value
    }

    public static func get(_ key: String, defaultValue: Int) -> Int {
        guard let value = ProcessInfo.processInfo.environment[key],
            let intValue = Int(value) else {
                return defaultValue
        }

        return intValue
    }

    public static func get(_ key: String, defaultValue: Double) -> Double {
        guard let value = ProcessInfo.processInfo.environment[key],
            let doubleValue = Double(value) else {
                return defaultValue
        }

        return doubleValue
    }

    public static func get(_ key: String, defaultValue: Bool) -> Bool {
        guard let value = ProcessInfo.processInfo.environment[key],
            let boolValue = Bool(value) else {
                return defaultValue
        }

        return boolValue
    }
}
