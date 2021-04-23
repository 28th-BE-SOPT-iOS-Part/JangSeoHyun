//
//  SignUpVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/20.
//

import UIKit

class SignUpVC: UIViewController {
    
    var id: String = ""
    var pw: String = ""
    var pwCheck: String = ""

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func goToFriendTab() {
        let tabBarStoryboard : UIStoryboard = UIStoryboard(name: "TabbarSetting", bundle: nil)
        if let tabBar = tabBarStoryboard.instantiateViewController(identifier: "TabBarVC") as? TabBarVC {
            tabBar.modalPresentationStyle = .fullScreen
            self.present(tabBar, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveToFriendTab(_ sender: Any) {
        if let idText = idTextField.text {
            id = idText
        }
        if let pwText = pwTextField.text {
            pw = pwText
        }
        if let pwCheckText = pwCheckTextField.text {
            pwCheck = pwCheckText
        }

        if id != "" && pw != "" && pwCheck != "" {
            goToFriendTab()
        }
        
        else {
            let alert = UIAlertController.init(title: "필수 입력값을 확인해주세요", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
    }
}
