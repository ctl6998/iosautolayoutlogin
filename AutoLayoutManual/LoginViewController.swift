//
//  LoginViewController.swift
//  AutoLayoutManual
//
//  Created by Chí Thành on 23/8/24.
//

import UIKit

class LoginViewController: UIViewController {
    
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
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = UIColor.orange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginPromptLabel: UILabel = {
        let label = UILabel()
        label.text = "Login to your account"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .orange.withAlphaComponent(0.2)
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.orange.cgColor
        
        // Create envelope icon
        let envelopeImage = UIImage(systemName: "envelope.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: envelopeImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create left view with icon and padding
        let leftView = UIView()
        leftView.addSubview(imageView)
        
        // Set up constraints for the image view within the left view
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            leftView.widthAnchor.constraint(equalToConstant: 44) // 16 leading + 20 icon + 8 trailing
        ])
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        // Right padding
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always
        
        // Placeholder
        textField.attributedPlaceholder = NSAttributedString(
            string: "Your Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange]
        )
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.backgroundColor = .orange.withAlphaComponent(0.2)
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.orange.cgColor
        
        // Create envelope icon
        let envelopeImage = UIImage(systemName: "lock.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: envelopeImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create left view with icon and padding
        let leftView = UIView()
        leftView.addSubview(imageView)
        
        // Set up constraints for the image view within the left view
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            leftView.widthAnchor.constraint(equalToConstant: 44) // 16 leading + 20 icon + 8 trailing
        ])
        
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        // Right padding
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always
        
        // Placeholder
        textField.attributedPlaceholder = NSAttributedString(
            string: "Your Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange]
        )
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        //NSAttributeText
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
        contentBox.addSubview(welcomeLabel)
        contentBox.addSubview(loginPromptLabel)
        contentBox.addSubview(emailField)
        contentBox.addSubview(passwordField)
        contentBox.addSubview(loginButton)
        contentBox.addSubview(signUpPromptLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentBox.topAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: contentBox.centerXAnchor),
            
            loginPromptLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            loginPromptLabel.centerXAnchor.constraint(equalTo: contentBox.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: loginPromptLabel.bottomAnchor, constant: 30),
            emailField.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.leadingAnchor.constraint(equalTo: contentBox.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: contentBox.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: contentBox.bottomAnchor, constant: -80),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpPromptLabel.bottomAnchor.constraint(equalTo: contentBox.bottomAnchor, constant: -40),
            signUpPromptLabel.centerXAnchor.constraint(equalTo: contentBox.centerXAnchor)
        ])
    }
    
}
