//
//  ViewController.swift
//  ExpandTableViewCell
//
//  Created by sujian on 2017/1/22.
//  Copyright © 2017年 sujian. All rights reserved.
//

import UIKit

let message1 = "Protests took place around the world on the first full day of Donald Trump's presidency. In Washington, protesters and supporters told the BBC what messages they would like to give to the other side."

let message2 = "The Sunday Times says an unarmed Trident missile fired from submarine HMS Vengeance near the Florida coast in June veered off course towards the US. The paper says the incident took place weeks before a crucial Commons vote on the future of Trident. The MoD did not give details of the test process but said it was a success."

class ViewController: UITableViewController {
    
    var feeds: [FeedItem] = {
        return (0..<100).map({
            FeedItem(avatar: "fox", nickname: "fox \($0)", desc: $0 % 2 == 0 ? message1 : message2 )
        })
    }()
    
    var lastExpandingIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell
        cell?.contentView.backgroundColor = indexPath.row % 2 == 1 ? UIColor.white : UIColor(colorLiteralRed: 0.612, green: 0.923, blue: 0.999, alpha: 0.5)
        cell?.avatar.image = UIImage(named: feeds[indexPath.row].avatar)
        cell?.nickname.text = feeds[indexPath.row].nickname
        cell?.desc.text = feeds[indexPath.row].desc
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return FeedTableViewCell.calucateHeight(feed: feeds[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if lastExpandingIndex != -1 {
            if lastExpandingIndex == indexPath.row {
                feeds[indexPath.row].expanding = !feeds[indexPath.row].expanding
                lastExpandingIndex = -1
            }else{
                reset()
                feeds[indexPath.row].expanding = !feeds[indexPath.row].expanding
                lastExpandingIndex = indexPath.row
            }
        }else{
            feeds[indexPath.row].expanding = !feeds[indexPath.row].expanding
            lastExpandingIndex = indexPath.row
        }
        
        tableView.reloadRows(at: [indexPath], with: .none)
        
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    func reset(){
        for index in 0..<feeds.count{
            feeds[index].expanding = false
        }
    }

}

