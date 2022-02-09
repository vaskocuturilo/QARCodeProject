//
//  ViewController.swift
//  QRCodeProject
//
//  Created by Anton Smirnov on 09.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func responseQRCode(endpoints: String, url: String, completionHandler: @escaping (Bool, String) -> ()) {
        let parameters: Parameters = [
            "code": url
        ]
        
        AF.request(endpoints, parameters: parameters).response { response in
            switch response.result {
            case .success(let responseData):
                self.myImageView.image = UIImage(data: responseData!, scale:1)
                
            case .failure(let error):
                print("error--->",error)
            }
        }
    }
}


