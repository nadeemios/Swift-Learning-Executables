
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

public struct Stack<Element>:Container {
   public var items:[Item] = []
   public mutating func append(_ item: Element) {
    items.append(item)
    }
   public var count: Int {
        return items.count
    }
  public  subscript(i:Int)->Element {
        get {
       return items[i]
        }set {
            items[i] = newValue
        }
    }
   public mutating func pop()->Element {
        return items.removeLast()
    }
    
}


/// parameteric , placeholder type automatically available inside the extensions
/// we are getting generic parametr result could not be inferred error to solve this we will constrinted using generic ehere clause

extension Stack where Element:Numeric {
    public func sum()->Element {
        let sum:Element = items.reduce(0, +)
        return sum
    }
}
