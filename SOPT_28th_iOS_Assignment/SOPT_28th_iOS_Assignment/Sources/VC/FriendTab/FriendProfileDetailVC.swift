//
//  FriendProfileDetail.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/22.
//

import UIKit

class FriendProfileDetailVC: UIViewController {
        
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var imgName: String = ""
    var name: String = ""
    
    var initialTouchPoint = CGPoint(x: 0, y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.image = UIImage(named: imgName)
        nameLabel.text = name
        addDragActionToView()
        // Do any additional setup after loading the view.
    }

    // MARK: - Drag down to dismiss presented View
    
    func addDragActionToView() {
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(dragDown))
        self.view.addGestureRecognizer(dragGesture)
    }

    @objc func dragDown(
        _ sender : UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view.window)

        if sender.state == .began {
            initialTouchPoint = touchPoint
        }
        else if sender.state == .changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.width, height: self.view.frame.height)
            }
        }
        else if sender.state == .ended || sender.state == .cancelled {
            if touchPoint.y - initialTouchPoint.y > 200 {
                self.dismiss(animated: false, completion: nil)
            }
            else {
                self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            }
        }
    }
    
    // MARK: - IBAction 뒤로가기 버튼
    
    @IBAction func backToFriendTab(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
