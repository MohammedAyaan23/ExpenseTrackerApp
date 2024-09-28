//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Mohammed Ayaan on 28/09/24.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [transaction]>
typealias TransactionPrefixSum = [(String,Double)]

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else{
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode==200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching Transaction", error.localizedDescription)
                case .finished:
                    print("Finished Fetching Transaction")
                    
                }
                
        
            } receiveValue: { [weak self]result in
                self?.transactions = result
//                dump(self?.transactions)
            }
            .store(in: &cancellables)

    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        return groupedTransactions
    }
    
}
