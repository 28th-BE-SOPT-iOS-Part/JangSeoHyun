//
//  ViewController.swift
//  28th_iOS_1st_Assignment
//
//  Created by 장서현 on 2021/04/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var id: String = ""
    var pw: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToFinish(_ sender: Any) {
        guard let finishVC = self.storyboard?.instantiateViewController(identifier: "FinishVC") as? FinishVC else {return}
        
        if let idText = idTextField.text {
            id = idText
        }
        if let pwText = pwTextField.text {
            pw = pwText
        }
        
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        if (id != "") && (pw != "") {
            finishVC.user = id
            finishVC.backToMain = true
            finishVC.modalPresentationStyle = .fullScreen
            self.present(finishVC, animated: true, completion: nil)
        }
        else if (id == "") {
            let alert1 = UIAlertController(title: "이메일 또는 전화번호를 입력해주세요", message: "", preferredStyle: .alert)
            alert1.addAction(action)
            present(alert1, animated: true, completion: nil)
        }
        else if (pw == "") {
            let alert2 = UIAlertController(title: "비밀번호를 입력해주세요", message: "", preferredStyle: .alert)
            alert2.addAction(action)
            present(alert2, animated: true, completion: nil)
        }
        else {
            let alert3 = UIAlertController(title: "필수입력값을 확인해주세요", message: "", preferredStyle: .alert)
            alert3.addAction(action)
            present(alert3, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveToAccount(_ sender: Any) {
        guard let accountVC = self.storyboard?.instantiateViewController(identifier: "AccountVC") as? AccountVC else {return}
        self.navigationController?.pushViewController(accountVC, animated: true)
    }
}

