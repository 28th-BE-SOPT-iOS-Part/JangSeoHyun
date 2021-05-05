//
//  FriendVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/23.
//

import UIKit

//protocol ProfileDetailProtocol {
//    func sendData(img: String, name: String)
//}

class FriendVC: UIViewController {

    @IBOutlet weak var friendListTV: UITableView!
    
    var friendList : [FriendDataModel] = []
//    var delegate : ProfileDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        setFriendList()
        friendListTV.delegate = self
        friendListTV.dataSource = self
        friendListTV.separatorStyle = .none
//        addTouchActionToImg()
    }
    
//    func addTouchActionToImg() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchMyProfile))
//        myProfile.addGestureRecognizer(tapGesture)
//        myProfile.isUserInteractionEnabled = true
//    }
//
//    @objc func touchMyProfile(_sender: UITapGestureRecognizer) {
//        guard let dvc = self.storyboard?.instantiateViewController(identifier: "FriendProfileDetailVC") as? FriendProfileDetailVC else {return}
//        dvc.modalPresentationStyle = .fullScreen
//        self.present(dvc, animated: false, completion: nil)
//    }

    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(imageName: "profileImage1",
                                name: "팟장님",
                                state: "짱짱"),
                
                FriendDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
                
                FriendDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
                
                FriendDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
                
                FriendDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
                
                FriendDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
                
                FriendDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
                
                FriendDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
                
                FriendDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendDataModel(imageName: "profileImage10",
                                name: "기가지니",
                                state: "오늘 날씨 어때")
            ])
        }
}

extension FriendVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 73
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "FriendProfileDetailVC") as? FriendProfileDetailVC else {return}
        dvc.modalPresentationStyle = .fullScreen
        if indexPath.section == 0 {
            guard let myProfileCell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTVC") as? MyProfileTVC else {return}
            dvc.imgName = "friendtabProfileImg"
            dvc.name = myProfileCell.myNameLabel.text ?? ""
            self.present(dvc, animated: true, completion: nil)
        }
        else {
//            delegate?.sendData(img: friendList[indexPath.row].imageName, name: friendList[indexPath.row].name)
            dvc.imgName = friendList[indexPath.row].imageName
            dvc.name = friendList[indexPath.row].name
            self.present(dvc, animated: true, completion: nil)
        }
    }
}

extension FriendVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let myProfileCell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTVC", for: indexPath) as? MyProfileTVC else { return UITableViewCell() }
            myProfileCell.selectionStyle = .none
            return myProfileCell
        }
        guard let friendProfileCell = tableView.dequeueReusableCell(withIdentifier: "FriendProfileTVC", for: indexPath) as? FriendProfileTVC else { return UITableViewCell() }
        friendProfileCell.selectionStyle = .none
        friendProfileCell.setFriendProfileData(img: friendList[indexPath.row].imageName,
                                               name: friendList[indexPath.row].name,
                                               state: friendList[indexPath.row].state)
        return friendProfileCell
    }
}
