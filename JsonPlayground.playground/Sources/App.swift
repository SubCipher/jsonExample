import Foundation

public struct App {
    enum Serialization: Error {
        case missing(String)
    }
    
    
    public let name: String
    public let link: String
    
    public init(name:String, link:String){
        self.name = name
        self.link = link
    }
    
    
    public init?(jsonObjectArray: [String : Any]) throws {
        
        guard let container = jsonObjectArray["im:name"] as? [String : Any],
            let name = container["label"] as? String else {
                throw Serialization.missing("name")
        }
        
        guard let id = jsonObjectArray["id"] as? [String : Any],
            
        let link = id["label"] as? String else {
            throw Serialization.missing("link")
        }
        
        self.name = name
        self.link = link
    }
}

