
import Alamofire
import Foundation
import SwiftConcepts
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


struct Bottle: Purchasable {
    var name:String
    func buy() {
        print("Purchased \(name) bottle")
    }
}
struct Mac: Purchasable {
    var name:String
    func buy() {
        print("Purchased \(name) mac")
    }
}


let books:Any  = [Bottle(name: "milton"),Mac(name: "macbook-air ")]
extension Array:Purchasable where Element:Purchasable {
    public func buy() {
        for i in self {
            i.buy()
        }
    }
}
func displayAllpurchasables(){
    if let items = books as? Purchasable {
        items.buy()
    }
}
displayAllpurchasables()
