//
//  ContentView.swift
//  HomeWork2
//
//  Created by mac on 17.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import OtusUI

struct ContentView: View {

    var body: some View {
        NavControllerView(transition: .custom(push: .move(edge: .trailing), pop: .slide))  {
            JobsScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
