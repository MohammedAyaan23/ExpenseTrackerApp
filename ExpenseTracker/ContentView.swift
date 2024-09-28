//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData: [Double] = [0,2,4,6,8,10,12]
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack(alignment:.leading, spacing: 24){
                    Text("OverView")
                        .font(.title2)
                        .bold()
                   
                        
                    // Mark: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.con, .primary)
                    
                    
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }

}

#Preview {
    ContentView()
}
