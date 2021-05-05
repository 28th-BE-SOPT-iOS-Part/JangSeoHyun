//
//  MyProfileTVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/05.
//

import UIKit

class MyProfileTVC: UITableViewCell {
    
    static let identifier : String = "MyProfileTVC"

    @IBOutlet weak var myProfileImg: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
