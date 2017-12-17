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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

