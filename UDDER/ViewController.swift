

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // URL
        let url  = URL(string: "https://ocr-text-extractor.p.rapidapi.com/detect-text-from-image-uri")
        guard  url != nil else{
            print("errro in URL")
            return
        }
        // URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // Header
        var  header = ["content-type": "application/json",
        "accept": "string",
        "x-rapidapi-key": "ef860e5215mshb51d7d3033e09c0p104bc0jsn0430e7b2c9cf",
        "x-rapidapi-host": "ocr-text-extractor.p.rapidapi.com"]
        request.allHTTPHeaderFields = header
        // Body
        let jsobBody = [  "Uri": "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
        "Language": "string",
        "DetectOrientation": false,
        "Scale": false,
        "IsTable": false,
        "OcrEngine": "string"] as [String:Any]
        do{
            let requestBody  = try JSONSerialization.data(withJSONObject: jsobBody, options: .fragmentsAllowed)
            request.httpBody=requestBody
            
        }catch{
            print("Error")
        }
        // request method
        request.httpMethod="POST"
        // url session
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if  error == nil && data != nil{
                
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    print(dictionary as Any)
                }catch{
                    
                }
            }
        }
        dataTask.resume()
        
    }

    


}

