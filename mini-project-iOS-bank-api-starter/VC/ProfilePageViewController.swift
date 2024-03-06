<<<<<<< HEAD
//
//  ProfilePageViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Amora J. F. on 06/03/2024.
//

import Foundation

class ProfilePageViewController: UIViewController{
    
    
=======
import UIKit
import SnapKit
import Kingfisher

class ProfilePageViewController: UIViewController {
    
    var user: User?
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let widthrawButton = UIButton(type: .system)
    let depositButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = " User Profile "
        
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(widthrawButton)
        view.addSubview(depositButton)
        
        
        setupViews()
        setupLayout()
        configure()
        
        let instructionsButton = UIBarButtonItem(title: "...", style: .plain, target: self, action: #selector(instructionsButtonTapped))
        navigationItem.rightBarButtonItem = instructionsButton
        
    }
    @objc private func instructionsButtonTapped(){
        let instructionsVC = InstructionsViewController()
        instructionsVC.modalPresentationStyle = .popover
        self.present(instructionsVC, animated: true, completion: nil)
    }
    
    
    private func setupViews(){
        profileImageView.image = UIImage(named: "kfh")
        profileImageView.layer.cornerRadius = 37.5
        profileImageView.clipsToBounds = true
        nameLabel.font = .systemFont(ofSize: 23, weight: .medium)
        emailLabel.font = .systemFont(ofSize: 23, weight: .medium)
    }
    
    private func setupLayout(){
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(180)
            profileImageView.layer.cornerRadius = 10
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        widthrawButton.setTitle(" widthraw", for: .normal)
        widthrawButton.backgroundColor = .lightGray
        widthrawButton.layer.cornerRadius = 5
        widthrawButton.setTitleColor(.white, for: .normal)
        widthrawButton.snp.makeConstraints { make in
            make.bottom.equalTo(depositButton.snp.top).offset(-16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            
            widthrawButton.addTarget(self, action: #selector(widthrawButtonTapped), for: .touchUpInside)
        }
        depositButton.setTitle(" deposit", for: .normal)
        depositButton.backgroundColor = .lightGray
        depositButton.layer.cornerRadius = 5
        depositButton.setTitleColor(.white, for: .normal)
        depositButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            
            depositButton.addTarget(self, action: #selector(depositButtonTapped), for: .touchUpInside)
            
        }
        
    }
    
    private func configure(){
        nameLabel.text = "User name:   \(user?.username ?? "Empty")"
        emailLabel.text = "User email:  \(user?.email ?? "Empty")"
        widthrawButton.setTitle("widthraw", for: .normal)
        depositButton.setTitle("deposit", for: .normal)
    }
    
    @objc func widthrawButtonTapped(){
        let widthrawViewController = WidthrawViewController()
        navigationController?.pushViewController(widthrawViewController, animated: true)
    }
    @objc func depositButtonTapped(){
        let depositViewController = DepositViewController()
        navigationController?.pushViewController(depositViewController, animated: true)
        
    }
>>>>>>> main
}
