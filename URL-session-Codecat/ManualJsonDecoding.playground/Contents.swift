import UIKit

let successJsonData = """
{
    "success": true,
    "data": {
        "name": "codecat15",
        "email": "codecat15@gmail.com"
    },
    "errorMessage": "no error",
    "code": 200
}

""".data(using: .utf8)

let failureJsonData = """

{
"success": false,
"data": "some error occured",
"errorMessage": "Invalid credentials",
"code": 401
}

""".data(using: .utf8)


// MARK: - UserResponse
struct UserResponse: Decodable {
    let success: Bool?
    let data: User?
    let message: String?
    let code: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case success
        case message = "errorMessage"
        case code
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.message = try container.decode(String.self, forKey: .message)
        self.data = try? container.decode(User.self, forKey: .data)
    }
}

struct User: Decodable {
    let name, email: String?
}

do {
    
    let result = try JSONDecoder().decode(UserResponse.self, from: failureJsonData!)
    debugPrint(result.data?.email)
    
} catch let error {
    debugPrint(error)
}

//###################################################
