
import Foundation


struct RegisterUser: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case password
    }
}
