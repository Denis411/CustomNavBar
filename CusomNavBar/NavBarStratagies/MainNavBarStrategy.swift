//
//  MainNavBarStrategy.swift
//  CusomNavBar
//
//  Created by I am the owner on 12/6/21.
//

import UIKit

final class MainNavBarStrategy: NavBarStratagy {
    var leftButtonOne : NavBarButtonView?
    var leftButtonTwo : NavBarButtonView?
    var rightButtonOne: NavBarButtonView?
    var rightButtonTwo: NavBarButtonView?
    
    init () {
        setUpLeftButton()
        setUpRightOne()
    }
    
    func setUpLeftButton() {
        let image = UIImage(systemName: "person")
        leftButtonOne = NavBarButtonView(frame: .zero, image: image)
        leftButtonOne!.addTarget(self, action: #selector(fuck), for: .touchUpInside)
    }
    
    func setUpRightOne() {
        let image = UIImage(systemName: "sun.min")
        rightButtonOne = NavBarButtonView(frame: .zero, image: image)
        leftButtonOne!.addTarget(self, action: #selector(leftFuck), for: .touchUpInside)
    }
    
    @objc func leftFuck() {
        print("Right button action triggered")
    }
    
    @objc func fuck() {
        print("LeftButton action was triggered")
    }
}
