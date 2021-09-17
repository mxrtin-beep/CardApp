//
//  LoginViewController.swift
//  Chinese
//
//  Created by Martin  Bourdev on 9/17/21.
//

import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
        static let buttonX: CGFloat = 25.0
        static let buttonHeight: CGFloat = 52.0
        static let buttonOffset: CGFloat = 10.0
        
        static let minPassword: Int = 8
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        view.backgroundColor = .systemBackground
        
        addSubviews()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height / 3.0)
        
        usernameEmailField.frame = CGRect(x: Constants.buttonX,
                                          y: headerView.bottom + Constants.buttonOffset,
                                          width: view.width - Constants.buttonX*2,
                                          height: Constants.buttonHeight)
        
        passwordField.frame = CGRect(x: Constants.buttonX,
                                     y: usernameEmailField.bottom + Constants.buttonOffset,
                                     width: view.width - Constants.buttonX*2,
                                     height: Constants.buttonHeight)
        
        loginButton.frame = CGRect(x: Constants.buttonX,
                                   y: passwordField.bottom + Constants.buttonOffset,
                                   width: view.width - Constants.buttonX*2,
                                   height: Constants.buttonHeight)
        
        createAccountButton.frame = CGRect(x: Constants.buttonX,
                                           y: loginButton.bottom + Constants.buttonOffset,
                                           width: view.width - Constants.buttonX*2,
                                           height: Constants.buttonHeight)
        
        configureHeaderView()
    }

    private func configureHeaderView()
    {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width / 2.0, height: headerView.height - view.safeAreaInsets.top)
        
    }
    private func addSubviews()
    {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }

    @objc private func didTapLoginButton() {
        
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= Constants.minPassword else {
            return
        }
        
        // login functionality
    }
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        
        return true
    }
}
