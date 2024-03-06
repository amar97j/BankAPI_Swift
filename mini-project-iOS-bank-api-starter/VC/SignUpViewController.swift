<<<<<<< HEAD
//
//  SignUpViewController.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Amora J. F. on 06/03/2024.
//

=======
>>>>>>> main
import UIKit
import Kingfisher
import Eureka
import SwiftUI

class SignUpViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupForm()
        
    }
    
<<<<<<< HEAD
 
    
=======
>>>>>>> main
    private func setupForm(){
        
        
        form +++ Section("Sign Up")
        
        <<< TextRow() { row in
            row.title = "📝 username"
            row.placeholder = " Enter your name"
            row.tag = "name"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< TextRow() { row in
            row.title = "🔐 password"
            row.placeholder = " Enter your password"
            row.tag = "password"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< EmailRow() { row in
            row.title = "📧 email"
            row.placeholder = " Enter your email"
            row.tag = "email"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        <<< ButtonRow(){ row in
            row.title = "Sign Up"
            row.onCellSelection { cell, row in
                print("button cell tapped")
                self.submitTapped()
            }
        }
        
    }
    
    @objc func submitTapped() {
<<<<<<< HEAD
            let errors = form.validate()
            guard errors.isEmpty else {
                presentAlertWithTitle(title: "🆘", message: "One of the text field in empty.")
                return
            }
            let nameRow: TextRow? = form.rowBy(tag: "name")
            let passwordRow: TextRow? = form.rowBy(tag: "password")
            let emailRow: EmailRow? = form.rowBy(tag: "email")
            let name = nameRow?.value ?? ""
            let password = passwordRow?.value ?? ""
            let email = emailRow?.value ?? ""
            
            let user = User(username: name, email: email, password: password)
            
            NetworkManager.shared.signup(user: user) { success in
                DispatchQueue.main.async {
                    switch success {
                    case .success(let tokenResponse):
                        print(tokenResponse.token)
                        
//                        let profileVc = ()
//                        self.navigationController?.pushViewController(profileVc, animated: true)
                        
                    case .failure(let error):
                        print(error)
                        
                    }
                }
            }
        }
        
        private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
    
    
        
    }
=======
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "🆘", message: "One of the text field in empty.")
            return
        }
        let nameRow: TextRow? = form.rowBy(tag: "name")
        let passwordRow: TextRow? = form.rowBy(tag: "password")
        let emailRow: EmailRow? = form.rowBy(tag: "email")
        
                let name = nameRow?.value ?? ""
                let password = passwordRow?.value ?? ""
                let email = emailRow?.value ?? ""
        
        let user = User(username: name, email: email, password: password)
        
        NetworkManager.shared.signup(user: user) { success in
            DispatchQueue.main.async {
                switch success {
                case .success(let tokenResponse):
                    print(tokenResponse.token)
                    
//                 navigation
                    let profileVc = ProfilePageViewController()
                    self.navigationController?.pushViewController(profileVc, animated: true)
                    
                case .failure(let error):
                    print(error)
                    
                }
            }
        }
    }
    
    private func presentAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
}
>>>>>>> main
