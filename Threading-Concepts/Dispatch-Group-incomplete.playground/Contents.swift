import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum StaticUrl : String {
    case posts = "https://jsonplaceholder.typicode.com/posts"
    case users = "https://jsonplaceholder.typicode.com/users"
}

struct HttpUtility {
    static let shared = HttpUtility()
    private init() {}
    public func request(urlRequest: URLRequest) {
        
        URLSession.shared.dataTask(with: urlRequest) { (serverData, urlResponse, error) in
            if(error == nil && serverData != nil){
                do {
                    debugPrint(String(data: serverData!, encoding: .utf8))
                } catch {
                    debugPrint("parser error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

class MainClass{
    func makeApiCalls(){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.

    }
    
    private func makeApiCall(for requestType : StaticUrl) {
        let request = URLRequest(url: URL(string: requestType.rawValue))
        HttpUtility.
    }
}
