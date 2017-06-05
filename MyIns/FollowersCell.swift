//
//  FollowersCell.swift
//  MyIns
//
//  Created by xcl on 2017/6/4.
//  Copyright © 2017年 xcl. All rights reserved.
//

import UIKit
import AVOSCloud

class FollowersCell: UITableViewCell {

    @IBOutlet weak var avaImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    
    var user : AVUser!
    
    //单击改变关注状态
    @IBAction func followBtn_clicked(_ sender: Any) {
        let title = followBtn.title(for:.normal)
        
        if title == "关 注"{
            guard user != nil else { return }
            AVUser.current()?.follow(user.objectId!, andCallback: {(success:Bool,error:Error?) in
                if success {
                    self.followBtn.setTitle("√ 已关注", for: .normal)
                    self.followBtn.backgroundColor = .green
                }else{
                    print(error?.localizedDescription)
                }
            })
        }else{
            guard user != nil else {return}
            
            AVUser.current()?.unfollow(user.objectId!, andCallback: {(success:Bool,error:Error?) in
                if success{
                    self.followBtn.setTitle("关 注", for: .normal)
                    self.followBtn.backgroundColor = .lightGray
                }else{
                    print(error?.localizedDescription)
                }
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //将头像变成圆形
        avaImg.layer.cornerRadius = avaImg.frame.width / 2
        avaImg.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
