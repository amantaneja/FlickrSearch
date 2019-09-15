//
//  Extensions.swift
//  FlickrSearchApp
//
//  Created by Aman Taneja on 15/09/19.
//  Copyright © 2019 Aman Taneja. All rights reserved.
//

import UIKit

extension UIToolbar {
    static func addDoneButtonToKeyboard(frame: CGRect, label: String, completion: @escaping () -> Void) {
        let keyBoardToolbar : UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 30))
        var itemsArray = [UIBarButtonItem]()
//        let doneButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: completion)
        let flexibleSpace : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        itemsArray.append(flexibleSpace)
//        itemsArray.append(doneButton)
        
        keyBoardToolbar.items = itemsArray
        keyBoardToolbar.sizeToFit()
    }
}
