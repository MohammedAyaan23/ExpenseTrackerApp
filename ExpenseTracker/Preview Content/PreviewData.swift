//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import Foundation

var transactionPreviewData = transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [transaction](repeating: transactionPreviewData, count: 10)
