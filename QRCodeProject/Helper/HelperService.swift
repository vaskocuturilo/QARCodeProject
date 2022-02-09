//
//  HelperService.swift
//  QRCodeProject
//
//  Created by Anton Smirnov on 09.02.2022.
//

import Foundation
import Alamofire

class HelperService {
    let message = Messages()
    
    public func responseRegion(endpoints: String, url: String, myImageView: UIImageView, completionHandler: @escaping (Bool, String) -> ()) {
        let parameters: Parameters = [
            "code": url
        ]
        
        AF.request(endpoints, parameters: parameters).response { response in
            switch response.result {
            case .success(let responseData):
                do {
                    if response.response?.statusCode == 200 {
                        myImageView.image = UIImage(data: responseData!, scale:1)
                    } else {
                        completionHandler(false, response.description)
                    }
                } catch let error as NSError {
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        completionHandler(false, utf8Text)
                    }else {
                        completionHandler(false, error.localizedDescription)
                    }
                }
                break
                
            case .failure(let error):
                print("Request error: \(error.localizedDescription)")
                completionHandler(false, error.localizedDescription)
                break
            }
        }
    }
}
