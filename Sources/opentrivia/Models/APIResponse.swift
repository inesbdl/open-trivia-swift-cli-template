import Foundation

struct APIResponse: Codable {

    let responseCode: Int
    let results: [Question]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}