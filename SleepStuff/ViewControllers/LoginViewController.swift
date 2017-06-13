//
//  LoginViewController.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func didTapLogin(userEmail: String, userPassword: String, viewController: LoginViewController)
}

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    weak var delegate: LoginViewControllerDelegate?
    
    fileprivate let viewModel: LoginViewModel
    
    fileprivate var tableView = UITableView(frame: .zero, style: .plain)
    
//    fileprivate var userEmail: String = ""
//    fileprivate var userPassword: String = ""
    
    fileprivate var userEmailTextField: UITextField? {
        didSet {
            
        }
    }
    
    fileprivate var userPasswordTextField: UITextField? {
        didSet {
            
        }
    }
    
    required init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupTitle() {
        self.title = "Login"
    }
    
    override func setupLoadView() {
        self.navigationItem.hidesBackButton = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: String(describing: LoginTextFieldCell.self), bundle: nil), forCellReuseIdentifier: String(describing: LoginTextFieldCell.self))
        self.tableView.register(UINib(nibName: String(describing: LoginButtonCell.self), bundle: nil), forCellReuseIdentifier: String(describing: LoginButtonCell.self))
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
    }
    
    override func setupConstraints() {
        self.tableView.autoPinEdgesToSuperviewEdges()
    }
    
    fileprivate func handleLoginTap() {
        self.view.endEditing(true)
        
        guard let userEmail = self.userEmailTextField?.text, !userEmail.isEmpty else {
            self.presentAlert(title: "Fout", subtitle: "Geef een geldig e-mailadres in", sender: self.userEmailTextField)
            return
        }
        
        guard let userPassword = self.userPasswordTextField?.text, !userPassword.isEmpty else {
            self.presentAlert(title: "Fout", subtitle: "Geef een geldig paswoord in", sender: self.userPasswordTextField)
            return
        }
        
        self.delegate?.didTapLogin(userEmail: userEmail, userPassword: userPassword, viewController: self)
    }
    
    private func presentAlert(title: String?, subtitle: String, sender: Any?) {
        let alertController = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { alert -> Void in
            if let textField = sender as? UITextField {
                textField.becomeFirstResponder()
            }
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension LoginViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = self.viewModel.availableRows[indexPath.row]
        let cell: UITableViewCell
        
        switch cellType {
        case .username:
            let aCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoginTextFieldCell.self), for: indexPath) as! LoginTextFieldCell
            aCell.setupCell(labelTitle: self.viewModel.titleForCellType(cellType: cellType), textfieldPlaceholder: self.viewModel.placeholderForCellType(cellType: cellType))
            if self.userEmailTextField == nil {
                self.userEmailTextField = aCell.contentTextField
//                self.userEmailTextField?.delegate = self
            }
            cell = aCell
            
        case .password:
            let aCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoginTextFieldCell.self), for: indexPath) as! LoginTextFieldCell
            aCell.setupCell(labelTitle: self.viewModel.titleForCellType(cellType: cellType), textfieldPlaceholder: self.viewModel.placeholderForCellType(cellType: cellType))
            if self.userPasswordTextField == nil {
                self.userPasswordTextField = aCell.contentTextField
//                self.userPasswordTextField?.delegate = self
            }
            cell = aCell
            
        case .loginButton:
            let aCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoginButtonCell.self), for: indexPath) as! LoginButtonCell
            aCell.setupCell(buttonTitle: self.viewModel.titleForCellType(cellType: cellType))
            aCell.tapAction = { [weak self] (cell) in
                guard let `self` = self else { print("self gone in File: \(#file) on Line: \(#line) in Function: \(#function)"); return }
                self.handleLoginTap()
            }
            cell = aCell
        }

        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension LoginViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
