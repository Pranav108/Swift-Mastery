import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let apiString = "https://jsonplaceholder.typicode.com/todos/1"

func makeApiCallToGetData(){
    let session = URLSession.shared
    let serviceUrl = URL(string: apiString)!
    let task = session.dataTask(with: serviceUrl) { serviceData, serviceResponse, error in
        if error == nil {
            let httpResponse = serviceResponse as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                // parse data for valid response
        
                let jsonData = try? JSONSerialization.jsonObject(with: serviceData!)
                
                let result = jsonData as! Dictionary<String,Any>
                
                print(result)
                
            }else{
                print("Request failed!!")
            }
        }
    }
    
    task.resume()
    
}

makeApiCallToGetData()
