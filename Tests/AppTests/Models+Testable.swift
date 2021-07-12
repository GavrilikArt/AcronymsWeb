@testable import App
import Fluent
import Vapor

extension App.User {
  static func create(name: String = "Luke",
                     username: String? = nil,
                     on database: Database
  ) throws -> User {
    let createUsername: String
    if let suppliedUsername = username {
      createUsername = suppliedUsername
    } else {
      createUsername = UUID().uuidString
    }

    let password = try Bcrypt.hash("password")
    let user = User(
      name: name,
      username: createUsername,
      password: password)
    try user.save(on: database).wait()
    return user
  }

}


extension App.Acronym {
  static func create(short: String = "TIL",
                    long: String = "Today I learned",
                    user: User? = nil,
                    on database: Database
  ) throws -> Acronym {
    var acronymUser = user
    if acronymUser == nil { acronymUser = try User.create(on: database)}
    
    let acronym = Acronym(short: short, long: long, userID: acronymUser!.id!)
    try acronym.save(on: database).wait()
    return acronym
  }
}

extension App.Category {
  static func create(
    name: String = "Random",
    on database: Database
  ) throws -> App.Category {
    let category = Category(name: name)
    try category.save(on: database).wait()
    return category
  }
}
