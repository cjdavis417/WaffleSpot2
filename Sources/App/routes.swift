import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // "send" is localhost:8080/send
    router.get("send") { req -> Message in
        let msg = Message(id: UUID(), username: "@twostraws", content: "Hello, World :-)", date: Date())
        return msg
    }
    
    // nothing in 'get()' which means that the root... localhost:8080
    router.get { req -> Future<View> in
        return try req.view().render("home")
    }
    
    router.get("chris") { req -> Future<View> in
        return try req.view().render("chris")
    }
}
