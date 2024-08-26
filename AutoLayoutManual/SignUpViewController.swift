//
//  SignUpViewController.swift
//  AutoLayoutManual
//
//  Created by Chí Thành on 23/8/24.
//

import UIKit

class SignUpViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let contentBox: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        //view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Fullname"
        field.backgroundColor = .orange.withAlphaComponent(0.2)
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0
        field.layer.borderColor = UIColor.orange.cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: field.frame.height))
        field.leftView = paddingView
        field.leftViewMode = .always
        field.rightView = paddingView
        field.rightViewMode = .always
        field.attributedPlaceholder = NSAttributedString(
            string: "Fullname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange]
        )
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
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
    
    private let signUpPromptLabel: UILabel = {
        let label = UILabel()
        
        let fullText = "Don't have an account? Sign Up"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        if let range = fullText.range(of: "Sign Up") {
            let nsRange = NSRange(range, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.orange, range: nsRange)
        }
        
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackgroundImage()
        setupLogoInView()
        setupBoxInView()
        setupContentBoxElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    private func setupLogoInView() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
        ])
    }
    
    private func setupBoxInView() {
        view.addSubview(contentBox)
        
        NSLayoutConstraint.activate([
            contentBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentBox.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func setupContentBoxElements() {
        contentBox.addSubview(nameField)
        contentBox.addSubview(loginButton)
        contentBox.addSubview(signUpPromptLabel)
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: contentBox.topAnchor, constant: 60),
            nameField.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: contentBox.bottomAnchor, constant: -80),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpPromptLabel.bottomAnchor.constraint(equalTo: contentBox.bottomAnchor, constant: -40),
            signUpPromptLabel.centerXAnchor.constraint(equalTo: contentBox.centerXAnchor)
        ])
    }

}
