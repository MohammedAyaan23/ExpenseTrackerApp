//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
