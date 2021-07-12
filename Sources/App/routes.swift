import Fluent
import Vapor
import Leaf

func routes(_ app: Application) throws {

  let acronymsController = AcronymsController()
  let usersController = UsersController()
  let categoriesController = CategoriesController()
  let websiteController = WebsiteController()
  
  try app.register(collection: acronymsController)
  try app.register(collection: usersController)
  try app.register(collection: categoriesController)
  try app.register(collection: websiteController)
}
