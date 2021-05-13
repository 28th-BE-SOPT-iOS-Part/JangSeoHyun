//
//  SignInVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/20.
//

import UIKit

class SignInVC: UIViewController {
    
    var id: String = ""
    var pw: String = ""

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
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
    
    func loginAction() {
        LoginService.shared.login(email: self.idTextField.text!, password: self.pwTextField.text!) { result in
            switch result
            {
            case .success(let data):
                if let result = data as? LoginDataModel {
                    self.makeAlert(title: "알림",
                                   message: result.message,
                                   okAction: { _ in
                                    self.goToFriendTab()
                                   })
                    UserDefaults.standard.setValue(result.data?.token, forKey: "userToken")
                }
            case .requestErr(let message):
                if let message = message as? String{
                    self.makeAlert(title: "알림",
                                   message: message)
                }
                
            default :
                print("ERROR")
            }
        }
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까?",
                              okAction: { _ in
                                self.loginAction()
                              })
//        if let idText = idTextField.text {
//            id = idText
//        }
//        if let pwText = pwTextField.text {
//            pw = pwText
//        }
//
//        if id != "" && pw != "" {
////            goToFriendTab()
//        }
//
//        else {
//            let alert = UIAlertController.init(title: "필수 입력값을 확인해주세요", message: "", preferredStyle: .alert)
//            let okAction = UIAlertAction.init(title: "확인", style: .default, handler: nil)
//            alert.addAction(okAction)
//            present(alert, animated: false, completion: nil)
//        }
    }
    
    @IBAction func moveToSignUp(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else {return}
        self.navigationController?.pushViewController(dvc, animated: false)
    }
}
