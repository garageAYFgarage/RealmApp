//
//  TableViewViewModel.swift
//  RealmApp
//
//  Created by iFARA💻 on 14.10.2022.
//

import Foundation

protocol NewTableViewVMProtocol {
    var dataSource: [Int] { get set }
    var numberOfRows: Int { get }
    
    func getCellTitle(at indexPath: IndexPath) -> String
}

final class TableViewViewModel: NewTableViewVMProtocol {
    var dataSource = [1, 2, 3, 4, 5]
    
    var numberOfRows: Int {
        dataSource.count
    }
    
    func getCellTitle(at indexPath: IndexPath) -> String {
        "\(dataSource[indexPath.row])"
    }
}
