//
//  ViewController.swift
//  Login
//
//  Created by Geoffrey Vedernikoff on 12/3/16.
//  Copyright © 2016 Geoffrey Vedernikoff. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {


    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var iv: UIImageView!
    

    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        iv.image = UIImage(named: "image.jpg")
        label.textColor = .white
        print("active")
        guard let url = URL(string:"http://172.20.3.90/cgi-bin/login?cmd=redirect&arubalp=51081ef5-8953-4985-bb33-54e6779445") else{ return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response{
                let responseText = response.description
                let str1=responseText
                if str1.range(of:"&ip") != nil {
                    
                    let splitedArray = str1.characters.split{$0 == "&"}.map(String.init)
                    print("拆分后的数组：\(splitedArray)")
                    
                    let mac = splitedArray[2].characters.split{$0 == "="}.map(String.init)[1]
                    let ip = splitedArray[3].characters.split{$0 == "="}.map(String.init)[1]
                    
                    print(mac)
                    print(ip)
                    // post 请求执行登录操作
                    let postString =
                        "action=login&username=" + "Y30150635" + "@free&password={B}" + "d2FuZ2NoZW5n" + "&ac_id=3&user_ip=" + ip + "&nas_ip=''&user_mac=" + mac + "&ajax=1";
                    
                    
                    var request = URLRequest(url: URL(string: "http://172.20.3.81:801/include/auth_action.php")!)
                    request.httpMethod = "POST"
                    request.timeoutInterval = 0.5
                    request.httpBody = postString.data(using: .utf8)
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else {                                                 // check for fundamental networking error
                            print("error=\(error)")
                            return
                        }
                        
                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                            print("statusCode should be 200, but is \(httpStatus.statusCode)")
                            print("response = \(response)")
                        }
                        
                        let responseString = String(data: data, encoding: .utf8)
                        print("responseString = \(responseString)")
                    }
                    task.resume()
                }
            }
            }.resume()
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

