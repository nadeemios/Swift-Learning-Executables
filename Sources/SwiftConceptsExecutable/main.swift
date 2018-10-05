
import Alamofire
import Foundation
print("Hello, world!")

func display(){
    // Alamofire 4
    let parameters: Parameters = ["foo": "bar"]
    
    Alamofire.request("", method: .get, parameters: parameters, encoding: JSONEncoding.default)
        .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
        }
        .validate { request, response, data in
            // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
            return .success
        }
        .responseJSON { response in
            debugPrint(response)
    }
}


display()
