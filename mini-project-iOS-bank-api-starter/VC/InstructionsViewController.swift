import UIKit
import SnapKit
import Kingfisher
import Eureka
import SwiftUI

class InstructionsViewController: FormViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUi()
        
    }
    
    func setupUi(){
        form +++ Section("Transaction history")
        
        <<< TextRow() { row in
            row.title = "Chase banke                 120kd"
            //            row.placeholder = ""
            row.tag = "chase "
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        
        func submitTapped(){
            
            let chaseRow: TextRow? = form.rowBy(tag: "chase")
            
            let chase = chaseRow?.value ?? ""
            
            
        }
        
    }
}
