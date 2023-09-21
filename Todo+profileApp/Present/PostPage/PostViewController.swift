//
//  AddViewController.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit
import SnapKit

class PostViewController: UIViewController {
    let viewModel = PostViewModel()
    
    var categorySection = Set((PostViewModel().getTodo().map{ $0.category }))
    
    var backButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    var addButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("저장", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return btn
    }()
    
    var tableView: UITableView = {
        var tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.sectionHeaderTopPadding = 3
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(addButton)
        view.addSubview(tableView)
        
        backButton.snp.makeConstraints{
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        addButton.snp.makeConstraints{
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).inset(-Constant.defalutMargin)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func setAddbtn() {
        let alert = UIAlertController(title: "완료 목록", message: "완료 하셨습니까?", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default){ ok in
            print("확인 버튼이 눌렸습니다.")
            self.viewModel.creatTodo(UseTodo(category: alert.textFields?.last?.text ?? "defaults", createDate: CurrentTime.getCurrentTime(), modifyDate: CurrentTime.getCurrentTime(), id: UUID(), isCompleted: false, title: alert.textFields?.first?.text ?? ""))
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive){ cancel in
            print("취소 버튼이 눌렸습니다.")
        }
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력하세요"
        }
        alert.addTextField { textField in
            textField.placeholder = "카테고리를 입력하세요"
        }
        alert.addAction(sucess)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc func tappedBackButton() {
        self.dismiss(animated: false)
    }
    
    @objc func tappedAddButton() {
        setAddbtn()
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = Array(categorySection).sorted()[section]
        return viewModel.getTodo().filter{ $0.category == data }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = Array(categorySection).sorted()[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setTodo(viewModel.getTodo().filter{ $0.category == data }[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.todoData = viewModel.getTodo().filter{ $0.category == Array(categorySection).sorted()[indexPath.section] }[indexPath.row]
        detailViewController.modalPresentationStyle = .fullScreen
        self.present(detailViewController, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorySection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(Array(categorySection).sorted()[section])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
