//
//  HeaderView.swift
//  MyIns
//
//  Created by xcl on 2017/5/19.
//  Copyright © 2017年 xcl. All rights reserved.
//

import UIKit
import AVOSCloud

class HeaderView: UICollectionReusableView {
    
    @IBOutlet weak var avaImg: UIImageView!
    @IBOutlet weak var fullnameLbl: UILabel!
    @IBOutlet weak var webTxt: UITextView!
    @IBOutlet weak var bioLbl: UILabel!
    
    @IBOutlet weak var posts: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var followings: UILabel!
    
    @IBOutlet weak var postsTitle: UILabel!
    @IBOutlet weak var followersTitle: UILabel!
    @IBOutlet weak var followingsTitle: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    //从GuestVC单击关注按钮
    @IBAction func followBtn_clicked(_ sender: Any) {
        let title = button.title(for: .normal)
        
        //获取当前的访客对象
        let user = guestArray.last
        
        if title == "关 注"{
            guard let user = user else { return }
            AVUser.current()?.follow(user.objectId!, andCallback: {(success:Bool,error:Error?) in
                if success {
                    self.button.setTitle("√ 已关注", for: .normal)
                    self.button.backgroundColor = .green
                }else{
                    print(error?.localizedDescription)
                }
            })
        }else{
            guard let user = user else {return}
            
            AVUser.current()?.unfollow(user.objectId!, andCallback: {(success:Bool,error:Error?) in
                if success{
                    self.button.setTitle("关 注", for: .normal)
                    self.button.backgroundColor = .lightGray
                }else{
                    print(error?.localizedDescription)
                }
            })
        }
    }
    
        
}
