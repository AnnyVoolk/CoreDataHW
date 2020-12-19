//
//  UIDevice.swift
//  HomeWork2
//
//  Created by Anna Volkova on 29.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

extension UIDevice {
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
