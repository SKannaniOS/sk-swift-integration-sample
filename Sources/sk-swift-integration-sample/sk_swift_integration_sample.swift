// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import RudderStackAnalytics

public final class SKSampleIntegrationPlugin: IntegrationPlugin {
    public var key: String = "SKSample"
    public var pluginType: PluginType = .terminal
    public var analytics: Analytics?
    var destination: SampleDestinationSdk?
    
    public init() {
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(#function)")
    }
    
    public func setup(analytics: Analytics) {
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(#function)")
        self.analytics = analytics
    }
    
    public func getDestinationInstance() -> Any? {
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(#function)")
        return self.destination
    }
    
    public func create(destinationConfig: [String : Any]) throws {
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(#function)")
        guard destination == nil else { return }
        self.destination = SampleDestinationSdk.create(apiKey: "asdf-1234")
    }
}

public extension SKSampleIntegrationPlugin {
    
    public func track(payload: TrackEvent) {
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(#function)")
        LoggerAnalytics.debug("SKSampleIntegrationPlugin :: \(payload)")
    }
}


class SampleDestinationSdk {
    
    private let key: String
    
    private init(key: String) {
        self.key = key
    }
    
    func track(event: String, properties: [String: Any]) {
        LoggerAnalytics.debug("SampleDestinationSdk: track event \(event) with properties \(properties)")
    }
    
    func screen(screenName: String, properties: [String: Any]) {
        LoggerAnalytics.debug("SampleDestinationSdk: screen event \(screenName) with properties \(properties)")
    }
    
    func group(groupId: String, traits: [String: Any]) {
        LoggerAnalytics.debug("SampleDestinationSdk: group event \(groupId) with traits \(traits)")
    }
    
    func identifyUser(userId: String, traits: [String: Any]) {
        LoggerAnalytics.debug("SampleDestinationSdk: identify user \(userId) with traits \(traits)")
    }
    
    func aliasUser(userId: String, previousId: String) {
        LoggerAnalytics.debug("SampleDestinationSdk: alias user \(userId) with previous ID \(previousId)")
    }
    
    func flush() {
        LoggerAnalytics.debug("SampleDestinationSdk: flush")
    }
    
    func reset() {
        LoggerAnalytics.debug("SampleDestinationSdk: reset")
    }
    
    func update() {
        LoggerAnalytics.debug("SampleDestinationSdk: update")
    }
    
    static func create(apiKey: String) -> SampleDestinationSdk {
        // Create SampleDestinationSdk SDK instance
        // Simulate a delay in creation if needed
        Thread.sleep(forTimeInterval: 1.0)
        LoggerAnalytics.debug("SampleDestinationSdk: SDK created with API key \(apiKey)")
        return SampleDestinationSdk(key: apiKey)
    }
}
