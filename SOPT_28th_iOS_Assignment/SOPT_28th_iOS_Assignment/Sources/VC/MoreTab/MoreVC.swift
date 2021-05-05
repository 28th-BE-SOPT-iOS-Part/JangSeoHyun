//
//  MoreVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/05/06.
//

import UIKit

class MoreVC: UIViewController {

    @IBOutlet weak var detailMenuCV: UICollectionView!
    
    private var menuList = ["메일", "캘린더", "서랍", "카카오콘", "메이커스", "선물하기", "이모티콘", "프렌즈", "쇼핑하기", "스타일", "주문하기", "멜론티켓", "게임", "멜론", "헤어샵", "전체서비스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMenuCV.dataSource = self
        detailMenuCV.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension MoreVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailMenuCVC.identifier, for: indexPath) as? DetailMenuCVC else { return UICollectionViewCell() }
        
        menuCell.setDetailData(title: menuList[indexPath.row])
        
        return menuCell
    }
}

extension MoreVC : UICollectionViewDelegate {
}

extension MoreVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (70/375)
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    // Cell 들의 상,하 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    // Cell 들의 좌,우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
}
