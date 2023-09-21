//
//  DetailViewController.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let viewModel = DetailViewModel()
    
    var backButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    var modifyContentButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("수정", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedModifyButton), for: .touchUpInside)
        return btn
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var todoData: UseTodo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
  
    func configureUI() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(modifyContentButton)
        
        backButton.snp.makeConstraints{
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        modifyContentButton.snp.makeConstraints{
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalTo(view)
        }
        
        titleLabel.text = todoData?.title
    }
    
    func setModifyButton() {
        let alert = UIAlertController(title: "내용 수정", message: "수정 하시게습니까?", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default){ ok in
            print("확인 버튼이 눌렸습니다.")
            if let todo = self.todoData {
                self.viewModel.updateTodo(todo: UseTodo(category: todo.category, createDate: todo.createDate, modifyDate: CurrentTime.getCurrentTime(), id: todo.id, isCompleted: todo.isCompleted, title: alert.textFields?.first?.text ?? ""))
                self.titleLabel.text = alert.textFields?.first?.text ?? ""
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive){ cancel in
            print("취소 버튼이 눌렸습니다.")
        }
        alert.addTextField { textField in
            textField.placeholder = "수정할 내용을 입력하세요"
        }
        alert.addAction(sucess)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc func tappedBackButton() {
        self.dismiss(animated: false)
    }
    
    @objc func tappedModifyButton() {
        setModifyButton()
    }
}
