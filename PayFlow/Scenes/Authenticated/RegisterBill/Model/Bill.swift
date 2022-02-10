
import Foundation


struct Bill: Codable {
    let title: String
    let dueDate: String
    let value: Double
    let barcode: String
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case dueDate
        case value
        case barcode
    }
}
