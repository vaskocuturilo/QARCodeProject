//
//  ViewController.swift
//  QRCodeProject
//
//  Created by Anton Smirnov on 09.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //helpers
    let applicationHelper = HelperService()
    let message = Messages()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        applicationHelper.responseRegion(endpoints: Constants.Endpoints.Create, url: textField.text!, myImageView: self.myImageView) { [self](isSucess, responseData) in
            if isSucess {
                textField.text?.removeAll()
            } else {
                if (responseData.description.contains("Could not connect to the server.")) {
                    message.showErrorMessage(message: "responseData.description")
                }
            }
        }
    }
}


