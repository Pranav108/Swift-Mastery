import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum EndPoint: String {
    case registerUser = "http://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    case getUser = "http://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

// Define an error enum for API-related errors
enum APIError: Error {
    case invalidResponse
    case invalidURL
    case requestFailed
    case invalidData
}

struct UserRegistrationRequest : Encodable {
    let name , email, password : String
    
//    enum CodingKeys : String, CodingKey {
//        case FirstName = "name"
//        case Email = "email"
//        case Password = "password"
//    }
}

struct ApiData: Decodable {
    let data: UserData
    let errorMessage: String
}


struct UserData: Decodable {
    let email, id, joining, name: String
}

struct User {
    private let session = URLSession.shared
    
   
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Any, APIError>) -> Void) {
        
        guard let url = URL(string: EndPoint.registerUser.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)

        do {
            let requestedData = UserRegistrationRequest(name: name, email: email, password: password)
            let requestedBody = try JSONEncoder().encode(requestedData)
            urlRequest.httpBody = requestedBody
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            completion(.failure(.invalidData))
        }
        
        session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let responseTemp = String(data: data, encoding: .utf8)
                print(responseTemp!)
                
                let response = try JSONDecoder().decode(ApiData.self, from: data)
                
                completion(.success(response))
            } catch {
                completion(.failure(.invalidResponse))
            }
        }.resume()
        
    }
    
    func getUser(completion: @escaping (Result<Any, APIError>) -> Void) {
        guard let url = URL(string: EndPoint.getUser.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([UserData].self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidResponse))
            }
        }
        
        task.resume()
    }
    
}

let user = User()

user.getUser { result in
    switch result {
    case .success(let response):
        debugPrint(response)
    case .failure(let error):
        debugPrint("Error: \(error)")
    }
}

user.registerUser(name: "sinchan", email: "sinchan123@gmail.com", password: "1234", completion: { result in
    switch result {
    case .success(let response):
        debugPrint(response)
    case .failure(let error):
        debugPrint("Error: \(error)")
    }
})
