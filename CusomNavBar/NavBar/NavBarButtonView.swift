//
//  NavBarButtonView.swift
//  CustomNavBar
//
//  Created by I am the owner on 11/23/21.
//

import UIKit

class NavBarButtonView: UIButton {
    
    private var image: UIImage?
    private var internalImage = UIImageView()

    override func layoutSubviews() { 
        setUpImageConstraints()
//      Color
        self.layer.backgroundColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        internalImage.tintColor = .yellow
        if image != nil {
            internalImage.image = image
        }
        self.addSubview(internalImage)
    }
    
    private func setUpImageConstraints() {
        self.addSubview(internalImage)
        internalImage.translatesAutoresizingMaskIntoConstraints = false
        internalImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65).isActive = true
        internalImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65).isActive = true
        internalImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        internalImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    internal func setUpImage(image: UIImage) {
        self.image = image
        self.layoutSubviews()
    }
    
    internal func clone() -> NavBarButtonView {
        return NavBarButtonView(frame: self.frame, image: self.image)
    }
    
//    MARK: - INITs
    init(frame: CGRect, image: UIImage?) {
        self.image = image
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
