//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            List{
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key){month, transactions in
                    Section{
                        // Mark: Transaction List
                        ForEach(transactions) {transaction in
                            TransactionRow(Transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        TransactionList()
    }
}
