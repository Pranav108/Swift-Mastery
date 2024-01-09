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
    let Name , Email, Password : String
    enum CodingKeys : String, CodingKey {
        
        case Name = "name"
        case Email = "email"
        case Password = "password"
    }
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
    
    private func makeRequest< T:Decodable> (urlString: String, resultType : T.Type , method: String, body: Data? = nil, completion: @escaping (Result<Any, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        if let body = body {
            urlRequest.httpBody = body
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
            
            do{
                let request = try JSONDecoder().decode(resultType.self, from: data)
                completion(.success(request))
            }catch {
                completion(.failure(.invalidResponse))
            }
        }.resume()
    }
    
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Any, APIError>) -> Void) {
        let dataDictionary = UserRegistrationRequest(Name: name, Email: email, Password: password)
        do {
            let requestBody = try JSONEncoder().encode(dataDictionary)
            makeRequest(urlString: EndPoint.registerUser.rawValue, resultType: ApiData.self, method: "POST", body: requestBody, completion: completion)
        } catch {
            completion(.failure(.invalidResponse))
        }
    }
    
    func getUser(completion: @escaping (Result<Any, APIError>) -> Void) {
        makeRequest(urlString: EndPoint.getUser.rawValue, resultType: [UserData].self, method: "GET", completion: completion)
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
