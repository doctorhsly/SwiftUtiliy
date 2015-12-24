//
//  FontUtility.swift
//  SwiftUtilityProject
//
//  Created by apple on 15/12/8.
//  Copyright © 2015年 TDENERGYs. All rights reserved.
//

import Foundation
import UIKit


// MARK: -计算String在指定宽度中的高度
/*!
计算String在指定宽度中的高度

- parameter font:          当前字体
- parameter content:       当前内容
- parameter bound:         当前范围
- parameter lineBreakMode: 换行格式

- example:
  测试实例：
  let string = "fdjsaflkdsjajklfjs专家房价疯狂的设计开发力度房间看电视就分开了"
  let size = contentSize(UIFont(name: "HelveticaNeue-Light", size: 13)!, content: string, bound:CGSizeMake(200, 100), lineBreakMode: NSLineBreakMode.ByWordWrapping)

- returns: 字符串的大小
*/
func contentSize(font: UIFont , content: String , bound:CGSize , lineBreakMode:NSLineBreakMode) -> CGSize {
    
    // 有两种方法
    //
    //   let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
    //   NSStringDrawingOptions.UsesFontLeading.rawValue,
    //   NSStringDrawingOptions.self)
    //
    //
    let options: NSStringDrawingOptions = .UsesLineFragmentOrigin
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = lineBreakMode//.ByCharWrapping//lineBreakMode;//
    
    let attributes = [NSFontAttributeName:font,
        NSParagraphStyleAttributeName:paragraphStyle.copy()]
    let boundingRect = content.boundingRectWithSize(bound, options: options, attributes:attributes, context:nil)
    
    return boundingRect.size
}

// MARK: -检查font的方法
/*!
检查font的方法
*/
func systemSupprotFont () {
    for name in UIFont.familyNames() {
        print(name)
        if let nameString: String? = name {
            print("Support Font:\(UIFont.fontNamesForFamilyName(nameString!))")
        }
    }
}


// MARK: -创建自定义的attributed字符串




