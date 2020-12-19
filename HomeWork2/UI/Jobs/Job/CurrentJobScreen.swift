//
//  CurrentJobScreen.swift
//  HomeWork2
//
//  Created by Anna Volkova on 30.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import OtusUI

struct CurrentJobScreen: View {
    
    @EnvironmentObject private var navViewModel: NavControllerViewModel
    @ObservedObject var currentJobViewModel: CurrentJobViewModel
    
    init(job: Jobs?) {
        self.currentJobViewModel = CurrentJobViewModel(job: job)
    }
    
    var body: some View {
        VStack {
            FakeNavBar(label: self.currentJobViewModel.job?.title ?? "", backAction: {
                self.currentJobViewModel.removeJobId()
            })
            Spacer()
            Text(self.currentJobViewModel.job?.company ?? "")
                .font(.title)
                .padding()
            Text(self.currentJobViewModel.job?.trimmedDescription ?? "")
                .font(.body)
                .lineLimit(6)
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            HStack {
                Spacer()
                Button(action: self.showFullJobDescription) {
                    Text("Show all description")
                }
                .foregroundColor(.blue)
                .font(.footnote)
                .padding()
            }
            HStack {
                Text("Email: \(self.currentJobViewModel.job?.url ?? "")")
                    .font(.footnote)
                    .padding(.leading, 20)
                Spacer()
            }
            Spacer()
        }.onAppear() {
            guard !self.currentJobViewModel.checkCurrentScreen() else { return }
            self.navViewModel.push(JobDescriptionScreen(description: nil))
        }
    }
    
    func showFullJobDescription() {
        let jobDescriptionScreen = JobDescriptionScreen(description: self.currentJobViewModel.job?.trimmedDescription)
        self.navViewModel.push(jobDescriptionScreen)
    }
}
