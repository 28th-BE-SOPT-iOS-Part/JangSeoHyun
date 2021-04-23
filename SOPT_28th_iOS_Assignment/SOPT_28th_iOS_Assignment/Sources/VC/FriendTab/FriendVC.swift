//
//  FriendVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/23.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var myProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTouchActionToImg()
    }
    
    func addTouchActionToImg() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchMyProfile))
        myProfile.addGestureRecognizer(tapGesture)
        myProfile.isUserInteractionEnabled = true
    }
    
    @objc func touchMyProfile(_sender: UITapGestureRecognizer) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "FriendProfileDetailVC") as? FriendProfileDetailVC else {return}
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
