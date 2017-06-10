//
//  MainViewController.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 04/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: class {
    func didTapLogout(viewController: MainViewController)
    func didTapSleepDiary(viewController: MainViewController)
}

class MainViewController: BaseViewController {
    
    weak var delegate: MainViewControllerDelegate?
    
    private let viewModel: MainViewModel
    
    private let sleepDiaryButton: UIButton = {
        let button = UIButton(forAutoLayout: ())
        button.addTarget(self, action: #selector(MainViewController.sleepDiaryAction), for: .touchUpInside)
        return button
    }()
    
    required init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupTitle() {
        self.title = self.viewModel.title()
    }
    
    override func setupLoadView() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: self.viewModel.logoutButtonTitle(), style: .plain, target: self, action: #selector(MainViewController.logout))
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.view.addSubview(self.sleepDiaryButton)
        self.sleepDiaryButton.setTitle(self.viewModel.sleepDiaryButtonTitle(), for: .normal)
        self.sleepDiaryButton.backgroundColor = .red
        self.sleepDiaryButton.layer.cornerRadius = 10
    }
    
    override func setupConstraints() {
        self.sleepDiaryButton.autoSetDimensions(to: CGSize(width: 200, height: 50))
        self.sleepDiaryButton.autoCenterInSuperview()
    }
    
    // MARK: - Actions
    
    func logout() {
        self.delegate?.didTapLogout(viewController: self)
    }
    
    func sleepDiaryAction() {
        self.delegate?.didTapSleepDiary(viewController: self)
    }
    
}
