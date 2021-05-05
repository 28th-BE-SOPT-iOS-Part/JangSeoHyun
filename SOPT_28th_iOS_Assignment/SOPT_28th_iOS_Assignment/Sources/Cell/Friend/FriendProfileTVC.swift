//
//  FriendProfileTVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/05.
//

import UIKit

class FriendProfileTVC: UITableViewCell {

    @IBOutlet weak var friendProfileImg: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendStateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriendProfileData(img : String, name : String, state : String) {
        if let image = UIImage(named: img) {
            friendProfileImg.image = image
        }
        friendNameLabel.text = name
        friendStateLabel.text = state
    }

}
