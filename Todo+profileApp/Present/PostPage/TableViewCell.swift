//
//  TableViewCell.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    let viewModel = PostViewModel()
    
    var labelText: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var switchButton: UISwitch = {
        var btn = UISwitch()
        btn.isOn = false
        btn.addTarget(self, action: #selector(tappedSwitchButton), for: .touchUpInside)
        return btn
    }()
    
    var todo: UseTodo?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(labelText)
        contentView.addSubview(switchButton)
        
        labelText.snp.makeConstraints{
            $0.top.leading.bottom.equalTo(safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        switchButton.snp.makeConstraints{
            $0.top.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
    }
    
    func setTodo(_ _todo: UseTodo) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted {
            labelText.text = nil
            labelText.attributedText = todo.title.strikeThrough()
        } else {
            labelText.attributedText = nil
            labelText.text = todo.title
        }
        switchButton.isOn = todo.isCompleted
    }
    
    @objc func tappedSwitchButton(sender: UISwitch) {
        guard let todo else { return }
        if switchButton.isOn {
            labelText.text = nil
            labelText.attributedText = todo.title.strikeThrough()
            viewModel.completeTodo(id: todo.id)
        } else {
            labelText.attributedText = nil
            labelText.text = todo.title
            viewModel.completeTodo(id: todo.id)
        }
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

