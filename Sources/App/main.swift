import Vapor

let drop = Droplet()

drop.get { request in
    return try JSON(node: [
        "message": "Hello, vapor!"
        ])
}

drop.get("hello") { request in
    return try JSON(node: [
        "message": "Hello, again!"
        ])
}

drop.get("players", Int.self) { request, players in
    return try JSON(node: [
        "message": "There are \(players) players here!"
        ])
}

drop.post("post"){ request in
    guard let name = request.data["name"]?.string else{
        throw Abort.badRequest
    }
    return try JSON(node:[
        "message":"Hello \(name)"
        ])

}

drop.run()
