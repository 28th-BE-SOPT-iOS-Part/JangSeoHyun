//
//  FinishVC.swift
//  28th_iOS_1st_Assignment
//
//  Created by 장서현 on 2021/04/09.
//

import UIKit

class FinishVC: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    
    var user : String?
    var backToMain : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel() {
        if let userName = self.user {
            userLabel.text = "\(userName)님"
        }
    }
    
    @IBAction func completeBtn(_ sender: UIButton) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
        if backToMain == true {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        }
    }
}
