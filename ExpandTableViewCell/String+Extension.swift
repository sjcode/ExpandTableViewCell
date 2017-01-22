//
//  String+Extension.swift
//  ExpandTableViewCell
//
//  Created by sujian on 2017/1/22.
//  Copyright © 2017年 sujian. All rights reserved.
//

import UIKit
extension String {
    var stringByRemovingWhitespaceAndNewlineCharacterSet: String {
        return components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
    }
    
    func calculateWidth(_ font : UIFont) -> CGFloat{
        let size = (self as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude,height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return size.width
    }
    
    func calculateLabelHeight(_ font : UIFont, width : CGFloat) -> CGFloat{
        let size = (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return size.height
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(self.startIndex, offsetBy: r.upperBound)
            
            return self[startIndex..<endIndex]
        }
    }
    
    subscript(r : NSRange) -> String{
        get{
            return (self as NSString).substring(with: r)
        }
    }
}
