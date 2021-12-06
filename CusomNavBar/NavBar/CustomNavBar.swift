//
//  CustomNavBar.swift
//  CusomNavBar
//
//  Created by I am the owner on 12/5/21.
//

import UIKit

final class CustomNavBar: UIView {
    
    var stratagy  : NavBarStratagy
    var city: String
    private var leftStack : UIStackView?
    private var rightStack: UIStackView?
    private var cityLabel : UILabel?
    
    //  INITs
    required init(frame: CGRect, navBar: NavBarStratagy, city: String) {
        self.stratagy = navBar
        self.city = city
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Some fucking fatal error occurred.")
    }
    
    override func layoutSubviews() {
        setUpButtonsSize()
//        setUpButtons()
        setUpLeftStack()
        setUpRightStack()
        setUpTextField()
    }
    
    private func setUpTextField() {
        cityLabel = UILabel()
        cityLabel?.text = city.capitalized
        cityLabel?.numberOfLines = 1
        cityLabel?.textAlignment = .center
        
        self.addSubview(cityLabel!)
        cityLabel?.translatesAutoresizingMaskIntoConstraints = false
        cityLabel?.leftAnchor.constraint(equalTo: leftStack!.rightAnchor).isActive = true
        cityLabel?.rightAnchor.constraint(equalTo: rightStack!.leftAnchor).isActive = true
        cityLabel?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cityLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setUpLeftStack() {
        
        leftStack = UIStackView()
        leftStack!.backgroundColor = .clear
        leftStack!.axis = .horizontal
        leftStack!.spacing = 8
        leftStack!.alignment = .center
        
        self.addSubview(leftStack!)
        leftStack!.translatesAutoresizingMaskIntoConstraints = false
        leftStack!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        leftStack!.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        leftStack!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        leftStack!.widthAnchor.constraint(equalToConstant: 32 * 2 + 8).isActive = true
        
        if let leftButtonOne = stratagy.leftButtonOne {
            leftStack?.addArrangedSubview(leftButtonOne)
        } else {
            let emptyButton = setUpEmptyButton()
            leftStack?.addArrangedSubview(emptyButton)
        }
        
        if let leftButtonTwo = stratagy.leftButtonTwo {
            leftStack?.addArrangedSubview(leftButtonTwo)
        } else {
            let emptyButton = setUpEmptyButton()
            leftStack?.addArrangedSubview(emptyButton)
        }
    }
    
    private func setUpRightStack() {
        
        rightStack = UIStackView()
        rightStack!.axis = .horizontal
        rightStack!.spacing = 8
        rightStack!.alignment = .center
        
        self.addSubview(rightStack!)
        rightStack!.translatesAutoresizingMaskIntoConstraints = false
        rightStack!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16 ).isActive = true
        rightStack!.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        rightStack!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        rightStack!.widthAnchor.constraint(equalToConstant: 32 * 2 + 8).isActive = true
        
        if let leftButtonTwo = stratagy.rightButtonTwo {
            rightStack?.addArrangedSubview(leftButtonTwo)
        } else {
            let emptyButton = setUpEmptyButton()
            rightStack?.addArrangedSubview(emptyButton)
        }
        
        if let leftButtonOne = stratagy.rightButtonOne {
            rightStack?.addArrangedSubview(leftButtonOne)
        } else {
            let emptyButton = setUpEmptyButton()
            rightStack?.addArrangedSubview(emptyButton)
        }
    }
    
    private func setUpButtonsSize() {
        stratagy.leftButtonOne?.translatesAutoresizingMaskIntoConstraints = false
        stratagy.leftButtonOne?.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stratagy.leftButtonOne?.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        stratagy.leftButtonTwo?.translatesAutoresizingMaskIntoConstraints = false
        stratagy.leftButtonTwo?.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stratagy.leftButtonTwo?.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        stratagy.rightButtonOne?.translatesAutoresizingMaskIntoConstraints = false
        stratagy.rightButtonOne?.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stratagy.rightButtonOne?.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        stratagy.rightButtonTwo?.translatesAutoresizingMaskIntoConstraints = false
        stratagy.rightButtonTwo?.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stratagy.rightButtonTwo?.widthAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func setUpEmptyButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.isUserInteractionEnabled = false
        return button
    }
    
    internal func setSelfConstratints(in vc: UIViewController) {
        vc.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor),
            self.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            self.rightAnchor.constraint(equalTo: vc.view.rightAnchor),
            self.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}

/// Buttons must be declared in order.
/// For instence, you should not declare leftButtonTwo if leftButtonOne is nil.
protocol NavBarStratagy {
    var leftButtonOne : NavBarButtonView? { get set }
    var leftButtonTwo : NavBarButtonView? { get set }
    var rightButtonOne: NavBarButtonView? { get set }
    var rightButtonTwo: NavBarButtonView? { get set }
}


