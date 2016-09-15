//
//  ViewController.swift
//  DroneMaster
//
//  Created by Rean on 9/15/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectToDroneAct(_ sender: AnyObject) {
        let header = ["x-commander-email":"hello@gmail.com"]
        Alamofire.request("http://challenge2.airtime.com:10001/start", method: .get, parameters: [:], encoding: URLEncoding.default, headers: header)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    let firstDict = self.convertStringToDictionary(text: String(describing: JSON))
                    
                }
                
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}

