//
//  FriendVC.swift
//  SOPT_28th_iOS_Assignment
//
//  Created by 장서현 on 2021/04/23.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var friendListTV: UITableView!
    
    var friendList : [FriendDataModel] = []
    
    static var selectedSection : Int = 0
    static var selectedImgName : String = ""
    static var selectedName : String = ""
    
    static func makeMyPreview() -> UIViewController {
        let storyboard = UIStoryboard(name: "FriendTab", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "FriendProfileDetailVC") as! FriendProfileDetailVC
        
        if selectedSection == 0 {
            dvc.imgName = "friendtabProfileImg"
            dvc.name = "장서현"
        }
        else {
            dvc.imgName = selectedImgName
            dvc.name = selectedName
        }
        return dvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func settingActionSheet(_ sender: Any) {
        let setting = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction.init(title: "편집", style: .default, handler: nil)
        let manageAction = UIAlertAction.init(title: "친구 관리", style: .default, handler: nil)
        let settingAction = UIAlertAction.init(title: "전체 설정", style: .default, handler: nil)
        let cancelAction = UIAlertAction.init(title: "취소", style: .cancel, handler: nil)
        
        setting.addAction(editAction)
        setting.addAction(manageAction)
        setting.addAction(settingAction)
        setting.addAction(cancelAction)
        
        self.present(setting, animated: true, completion: nil)
    }
    
}

extension FriendVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 73
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: {
            action, view, completionHandler in
            print("스와이프 - 숨김")
            completionHandler(true)
        } )
        
        let blockAction = UIContextualAction(style: .normal, title: "차단", handler: {
            action, view, completionHandler in
            print("스와이프 -- 차단")
            completionHandler(true)
        })
        
        hideAction.backgroundColor = UIColor(red: 103/255, green: 107/255, blue: 114/255, alpha: 1.0)
        blockAction.backgroundColor = UIColor(red: 207/255, green: 97/255, blue: 58/255, alpha: 1.0)

        return UISwipeActionsConfiguration(actions: [blockAction, hideAction])
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        FriendVC.selectedSection = indexPath.section
        FriendVC.selectedImgName = friendList[indexPath.row].imageName
        FriendVC.selectedName = friendList[indexPath.row].name
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: FriendVC.makeMyPreview) { suggestedActions in
            let chat = UIAction(title: "채팅하기", image: nil) { _ in
                print("메뉴 - 채팅하기")
            }
            let voiceTalk = UIAction(title: "보이스톡", image: nil) { action in
                print("메뉴 - 보이스톡")
            }
            let faceTalk = UIAction(title: "페이스톡", image: nil) {action in
                print("메뉴 - 페이스톡")
            }
            let present = UIAction(title: "선물하기", image: nil) { action in
                print("메뉴 - 선물하기")
            }

            return UIMenu(title: "", children: [chat, voiceTalk, faceTalk, present])
        }
    }
    
    func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        animator.addCompletion {
            let dvc = self.storyboard?.instantiateViewController(withIdentifier: "FriendProfileDetailVC") as! FriendProfileDetailVC
            dvc.modalPresentationStyle = .fullScreen
        
            if FriendVC.selectedSection == 0 {
                dvc.imgName = "friendtabProfileImg"
                dvc.name = "장서현"
            }
            else {
                dvc.imgName = FriendVC.selectedImgName
                dvc.name = FriendVC.selectedName
            }
            
            self.present(dvc, animated: true, completion: nil)
        }
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
