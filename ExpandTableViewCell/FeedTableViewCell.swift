//
//  FeedTableViewCell.swift
//  ExpandTableViewCell
//
//  Created by sujian on 2017/1/22.
//  Copyright © 2017年 sujian. All rights reserved.
//

import UIKit

struct FeedItem{
    var avatar: String
    var nickname: String
    var desc: String
    
    var expanding: Bool
    
    init(avatar: String, nickname: String, desc: String, expanding: Bool = false) {
        self.avatar = avatar
        self.nickname = nickname
        self.desc = desc
        self.expanding = expanding
    }
}

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    class func calucateHeight(feed: FeedItem) -> CGFloat {
        
        if feed.expanding {

            return feed.desc.calculateLabelHeight(UIFont.systemFont(ofSize: 14), width: UIScreen.main.bounds.width) + 8 * 3 + 50
            
        }else{
            return 67
        }
    }
}
