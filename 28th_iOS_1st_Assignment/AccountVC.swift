//
//  AccountVC.swift
//  28th_iOS_1st_Assignment
//
//  Created by 장서현 on 2021/04/09.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    var id: String = ""
    var pw: String = ""
    var check: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveToFinish(_ sender: UIButton) {
        guard let finishVC = self.storyboard?.instantiateViewController(identifier: "FinishVC") as? FinishVC else {return}
        
        if let idText = idTextField.text {
            id = idText
        }
        if let pwText = pwTextField.text {
            pw = pwText
        }
        if let checkText = checkTextField.text {
            check = checkText
        }
        
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        if (pw != check) && (id != "") {
            let alert1 = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "", preferredStyle: .alert)
            alert1.addAction(action)
            present(alert1, animated: true, completion: nil)
        }
        else if (pw == check) && (pw != "") {
            if id == "" {
                let alert2 = UIAlertController(title: "이메일 또는 전화번호를 입력해주세요", message: "", preferredStyle: .alert)
                alert2.addAction(action)
                present(alert2, animated: true, completion: nil)
            }
            else {
                finishVC.user = id
                finishVC.backToMain = false
                finishVC.modalPresentationStyle = .fullScreen
                self.present(finishVC, animated: true, completion: nil
                )
            }
        }
        else {
            let alert3 = UIAlertController(title: "필수입력값을 확인해주세요", message: "", preferredStyle: .alert)
            alert3.addAction(action)
            present(alert3, animated: true, completion: nil)
        }
    }
}
