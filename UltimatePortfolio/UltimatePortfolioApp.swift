//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Luke Inger on 10/09/2023.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView{
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
