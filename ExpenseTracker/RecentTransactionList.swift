//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            HStack{
                // Mark Header Title
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                // Mark Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4){
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.txt)
                }

            }
            .padding(.top)
            // Mark: Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id:\.element) { index, transaction in
                TransactionRow(Transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x:0, y: 5)
    }
}

#Preview {
//    static let transactionListVM: TransactionListViewModel = {
//        let transactionListVM = TransactionListViewModel()
//        transactionListVM.transactions = transactionPreviewData
//        return transactionListVM
//    }()
    NavigationView{
        RecentTransactionList()
    }
//        .environmentObject(transactionListVM)
}
