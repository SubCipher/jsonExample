import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
    
    guard let jsonData = try? JSONSerialization.jsonObject(with:data) as? [String : Any]
        
        else {   PlaygroundPage.current.finishExecution() }
    
    guard let feed = jsonData?["feed"] as? [String : Any],
        
        let apps = feed["entry"] as? [[String : Any]],
        let firstApp = apps.first else {  PlaygroundPage.current.finishExecution() }
   
    do {  let app = try App(jsonObjectArray: firstApp); print(apps) }
        
    catch let error {  print(error)   }
}
