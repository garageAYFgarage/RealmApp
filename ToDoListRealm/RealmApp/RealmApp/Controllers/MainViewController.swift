//
//  MainViewController.swift
//  RealmApp
//
//  Created by iFARA💻 on 13.10.2022.
//

// 1) Create and configure Segmented control
// 2) Create and configure tableview
// 3) Create and configure datasource to display 5 random tasks
// 4) Create new ViewController (DetailsViewController) + Add TableView there

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    let items = ["A-Z", "Date"]
    
    //MARK: - UIElements
    
    // 1) add Segmented Control
    lazy var segmentedControl: UISegmentedControl = {
        var segmentedControl = UISegmentedControl(items: items)
        return segmentedControl
    }()
    
    
    // 2) Add tableview
     let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    //MARK: - Properties
    private let viewModel: NewTableViewVMProtocol
    
    //MARK: - LifeCycle
    init(viewModel: NewTableViewVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task Lists"
        setupUI()
        setupLayout()
    }
    //MARK: - Actions
    
    @objc func createSuitSegmentedControl(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .green
        case 1:
            view.backgroundColor = .red
        default:
            view.backgroundColor = .white
        }
    }
    //MARK: - Private Helpers
    
    private func setupUI() {
        
        view.backgroundColor = .white
        //        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        segmentedControl.addTarget(self, action: #selector(createSuitSegmentedControl), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupLayout() {
        
        // Layout here!!!
        
        // 1) Segmented control on top
        view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(40)
        }
        
        // 2) TableView top = segmentedControl.bootob
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
}
    
    //MARK: - Helpers

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getCellTitle(at: indexPath)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected index = \(indexPath.row)")
//
////        let element = viewModel.selectedElement(at: indexPath)
////        let vc = TaskListViewController()
//
//    }
    
    
}


// TODO:
// 1) CREATE NEW VIEW CONTROLLER
