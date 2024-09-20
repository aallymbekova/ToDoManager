//
//  Resources.swift
//  ToDoManager
//
//  Created by Aliya Alymbekova on 9/9/24.
//

import UIKit

enum R {
    enum Strings {
        enum Tabbar {
            static let title = "Today's Task"
            static let day = "Wednesday, 11 May"
            static let button = "New Task"
        }
        
        enum StatusItem {
            static let all = "All"
            static let open = "Open"
            static let closed = "Closed"
        }
        
        enum TaskListCell {
            static let today = "Today"
        }
    }
    
    enum Colors {
        static let background = UIColor(hexString: "F9F9F9")
        static let cellBackground = UIColor(hexString: "FFFFFF")
        static let title = UIColor(hexString: "000000")
        static let secondary = UIColor(hexString: "A9A9A9")
        static let buttonBackground = UIColor(hexString: "E4EBF9")
        static let buttonText = UIColor(hexString: "3E6AC4")
        static let active = UIColor(hexString: "2860F6")
        static let inactive = UIColor(hexString: "DADADA")
        static let lightGray = UIColor(hexString: "F4F4F4")
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont()
        }
        
        static func helveticaNeue(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaNeue", size: size) ?? UIFont()
        }
    }
}
