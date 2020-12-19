//
//  UIApplication.swift
//  HomeWork2
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

extension UIApplication {
    
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}
