//
//  ViewController.swift
//  CusomNavBar
//
//  Created by I am the owner on 12/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    var navBar: CustomNavBar!

    override func viewDidLoad() {
        
        let stratagy = MainNavBarStrategy()
        navBar = CustomNavBar(frame: .zero, navBar: stratagy, city: "Some city")
        navBar.setSelfConstratints(in: self)
        navBar.backgroundColor = .white
        view.backgroundColor = .blue
        
    }
}

