//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var Transaction:transaction
    
    var body: some View {
        HStack(spacing:20){
           // Mark: Transaction category icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.con.opacity(0.4))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: Transaction.icon), fontsize: 24, color: Color.con)
                }
            
            VStack(alignment:.leading,spacing:6){
                // Mark: Transaction Merchant
                Text(Transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                // Mark: Transaction Category
                Text(Transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                // Mark: Transaction Date
                Text(Transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            // Mark: Transaction Amount
            Text(Transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(Transaction.type == TransactionType.credit.rawValue ? Color.txt : .primary)
            
        }
        .padding([.top,.bottom],8)
    }
}

#Preview {
    TransactionRow(Transaction: transactionPreviewData)
}
