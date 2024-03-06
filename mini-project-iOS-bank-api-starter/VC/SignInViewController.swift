import UIKit
import Eureka

class SignInViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupForm()
    }

    private func setupForm() {
        form +++ Section("Sign In")

        <<< TextRow() { row in
            row.title = "📝 Username"
            row.placeholder = "Enter your username"
            row.tag = "username"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< PasswordRow() { row in
            row.title = "🔐 Password"
            row.placeholder = "Enter your password"
            row.tag = "password"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        <<< ButtonRow() { row in
            row.title = "Sign In"
            row.onCellSelection { cell, row in
                print("Sign-in button tapped")
                self.signInTapped()
            }
        }
    }

    @objc private func signInTapped() {
        let errors = form.validate()
        guard errors.isEmpty else {
            presentAlertWithTitle(title: "🆘", message: "One of the text fields is empty.")
            return
        }

        let usernameRow: TextRow? = form.rowBy(tag: "username")
        let passwordRow: PasswordRow? = form.rowBy(tag: "password")

        let username = usernameRow?.value ?? ""
        let password = passwordRow?.value ?? ""

        let user = User(username: username, email: "", password: password)

        NetworkManager.shared.signIn(user: user) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let tokenResponse):
                    print(tokenResponse.token)
                    
 

                case .failure(let error):
                    print(error)
                   
                    self.presentAlertWithTitle(title: "Error", message: "Sign-in failed. Please try again.")
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
