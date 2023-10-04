//
//  SidebarView.swift
//  UltimatePortfolio
//
//  Created by Luke Inger on 04/10/2023.
//

import SwiftUI

struct SidebarView: View {
    
    @EnvironmentObject var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.id ?? UUID(), name: tag.name ?? "", icon: "tag", tag: tag)
        }
    }
    
    var body: some View {
        List(selection: $dataController.selectedFilter){
            Section("Smart Filters") {
                ForEach(smartFilters){ filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            Section("Tags"){
                ForEach(tagFilters){ filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
        }
        .toolbar{
            Button {
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("Add Sample Data", systemImage: "flame")
            }
        }
    }
}

#Preview {
    SidebarView()
        .environmentObject(DataController.preview)
}
