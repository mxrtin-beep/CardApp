//
//  LoginViewController.swift
//  Chinese
//
//  Created by Martin  Bourdev on 9/17/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
    }

    private func addSubviews()
    {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }

    @objc private func didTapLoginButton() {}
    @objc private func didTapCreateAccountButton() {}
}
