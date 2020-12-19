//
//  JobsScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 28.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import OtusUI

struct JobsScreen: View {
    
    @EnvironmentObject var viewModel: JobsViewModel
    @EnvironmentObject var navViewModel: NavControllerViewModel
    
    var body: some View {
        VStack {
            JobsScreenList(viewModel: viewModel)
        } .onAppear() {
            guard !self.viewModel.checkOpeningScreen() else { return }
            self.navViewModel.push(CurrentJobScreen(job: nil))
        }
    }
}

struct JobsScreen_Previews: PreviewProvider {
    static var previews: some View {
        JobsScreen()
    }
}
