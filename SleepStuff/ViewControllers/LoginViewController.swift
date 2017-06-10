//
//  LoginViewController.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 03/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func didTapLogin(viewController: LoginViewController)
}

class LoginViewController: BaseViewController {

    weak var delegate: LoginViewControllerDelegate?
    
    fileprivate let viewModel: LoginViewModel
    
    fileprivate var tableView = UITableView(frame: .zero, style: .plain)
    
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
        case .username, .password:
            let aCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoginTextFieldCell.self), for: indexPath) as! LoginTextFieldCell
            aCell.setupCell(labelTitle: self.viewModel.titleForCellType(cellType: cellType), textfieldPlaceholder: self.viewModel.placeholderForCellType(cellType: cellType))
            cell = aCell
        case .loginButton:
            let aCell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoginButtonCell.self), for: indexPath) as! LoginButtonCell
            aCell.setupCell(buttonTitle: self.viewModel.titleForCellType(cellType: cellType))
            aCell.tapAction = { [weak self] (cell) in
                guard let `self` = self else { print("self gone in File: \(#file) on Line: \(#line) in Function: \(#function)"); return }
                self.delegate?.didTapLogin(viewController: self)
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
