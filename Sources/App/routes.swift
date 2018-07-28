import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.get("send") { req -> Message in
        let msg = Message(id: UUID(), username: "@twostraws", content: "Hello, World :-)", date: Date())
        return msg
    }
}
