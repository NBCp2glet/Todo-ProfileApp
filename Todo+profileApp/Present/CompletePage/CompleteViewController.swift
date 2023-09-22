//
//  CompleteViewController.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import SnapKit
import UIKit

class CompleteViewController: UIViewController {
    let viewModel = CompleteViewModel()
    
    var backButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tv
    }()
    
    lazy var completeList = self.viewModel.getTodo().filter { $0.isCompleted == true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func tappedBackButton() {
        dismiss(animated: false)
    }
}

extension CompleteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setTodo(completeList[indexPath.row])
        return cell
    }
}
