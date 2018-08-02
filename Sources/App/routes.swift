import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // "send" is localhost:8080/send
    router.post("send") { req -> Future<Message> in
        
        // syncronously pulls the data from the html form
        let username: String = try req.content.syncGet(at: "username")
        let content: String = try req.content.syncGet(at: "content")
        
        // creates a message struct from the web data
        let msg = Message(id: nil, username: username, content: content, date: Date())
        
        return msg.save(on: req)

    }
    
    // nothing in 'get()' which means that the root... localhost:8080
    // creates an array of messages from the DB and returns it to the views
    router.get { req -> Future<View> in
        return Message.query(on: req).all().flatMap(to: View.self) { messages in
            let context = ["messages" : messages]
            return try req.view().render("home", context)
        }
    }
    
    router.get("chris") { req -> Future<View> in
        return try req.view().render("chris")
    }
}
