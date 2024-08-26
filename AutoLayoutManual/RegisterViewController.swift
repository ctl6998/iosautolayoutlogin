//
//  RegisterViewController.swift
//  AutoLayoutManual
//
//  Created by Chí Thành on 23/8/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Best app for your trip"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackgroundImage()
        addTitleLabel()
        addButton()
    }
    
    private func addBackgroundImage() {
        if let backgroundImage = UIImage(named: "registerBackground") {
            let imageView = UIImageView(frame: view.bounds)
            imageView.image = backgroundImage
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            view.insertSubview(imageView, at: 0)
        }
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func addButton() {
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //signUpButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20).isActive = true
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    

}
