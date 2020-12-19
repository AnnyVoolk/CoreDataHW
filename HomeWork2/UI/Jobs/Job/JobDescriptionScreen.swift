//
//  JobDescriptionScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct JobDescriptionScreen: View {
    
    let description: String
    private let userDeafaults = UserDefaults.standard
    
    init(description: String?) {
        self.userDeafaults.set(ViewControllers.currentJobDescription, forKey: UserDefaultsName.currentScreen)
        guard let description = description else {
            self.description = userDeafaults.string(forKey: UserDefaultsName.jobDescription) ?? ""
            return
        }
        self.userDeafaults.set(description, forKey: UserDefaultsName.jobDescription)
        self.description = description
    }
    
    var body: some View {
        ScrollView{
            FakeNavBar(label: "Full job description", backAction: {
                self.userDeafaults.set(ViewControllers.currentJob, forKey: UserDefaultsName.currentScreen)
            })
            Spacer()
            Text(self.description)
                .padding()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct JobDescriptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        JobDescriptionScreen(description: "")
    }
}
