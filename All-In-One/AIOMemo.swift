//
//  AIOMemo.swift
//  All-In-One
//
//  Created by Albin Berisha on 7/20/20.
//  Copyright © 2020 Albin Berisha. All rights reserved.
//

import Foundation

class AIOMemo: NSObject, NSCoding {
    
    static let Dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = Dir.appendingPathComponent("memos")
    
    var title: String = ""
    var text: String = ""
    
    init?(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let text = aDecoder.decodeObject(forKey: "text") as! String
        self.init(title: title, text: text)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(text, forKey: "text")
    }
    
}
