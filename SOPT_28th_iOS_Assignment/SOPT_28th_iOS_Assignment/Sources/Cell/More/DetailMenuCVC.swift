//
//  DetailMenuCVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/06.
//

import UIKit

class DetailMenuCVC: UICollectionViewCell {
    static let identifier = "DetailMenuCVC"
    
    @IBOutlet weak var detailMenuImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setDetailData(title: String) {
        detailMenuImg.image = UIImage(named: "messageTabIcon")
        titleLabel.text = title
    }
}
