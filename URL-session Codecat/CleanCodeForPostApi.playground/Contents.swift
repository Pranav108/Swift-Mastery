import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum Endpoint : String {
    case registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    case getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

struct UserRegistrationRequest : Encodable {
    let Name , Email, Password : String
    enum CodingKeys : String, CodingKey {
        case Name = "name"
        case Email = "email"
        case Password = "password"
    }
}

struct UserRegistrationResponse: Decodable {
    let errorMessage: String
    let data: UserData
}

struct UserData: Decodable {
    let name, email, id, joining: String
}

struct HttpUtility{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void){
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0){
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void){
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0){
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    completionHandler(response)
                }catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
struct User{
    var httpUtility : HttpUtility
    
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func registerUserWithEncodableProtocol(){
        //code to register user
        let registrationUrl = URL(string: Endpoint.registerUser.rawValue)
        
        let request = UserRegistrationRequest(Name: "sinchan", Email: "nuhara@gmail.com", Password: "1239")
        
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            httpUtility.postApiData(requestUrl: registrationUrl!, requestBody: encodedRequest, resultType: UserRegistrationResponse.self) { (userRegistrationResponse) in
                if(userRegistrationResponse.errorMessage.isEmpty) {
                    print("Registerd user data : ")
                    print("name : \(userRegistrationResponse.data.name)")
                    print("email : \(userRegistrationResponse.data.email)")
                    print("joining : \(userRegistrationResponse.data.joining)")
                }
            }
        } catch let error {
            debugPrint("error = \(error.localizedDescription)")
        }
    }
    
    func getAllRegisterUserResponses() {
        //code to get all users
        let getUserUrl = URL(string: Endpoint.getUser.rawValue)
        httpUtility.getApiData(requestUrl: getUserUrl!, resultType: [UserData].self) { allUserResponseResult in
            print("All Registration Response : ")
            for el in allUserResponseResult {
                print("person info : \(el.name), \(el.email), \(el.id)")
            }
        }
    }
}

let objUser = User(_httpUtility: HttpUtility())
objUser.registerUserWithEncodableProtocol()
objUser.getAllRegisterUserResponses()
