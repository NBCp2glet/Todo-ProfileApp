//
//  ViewController.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var imageView: UIImageView = {
        var view = UIImageView()
        view.load(url: URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg")!)
        return view
    }()
    
    var checkTodo: UIButton = {
        var btn = UIButton()
        btn.setTitle("할일 확인하기", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedCheckTodo), for: .touchUpInside)
        return btn
    }()
    
    var completeTodo: UIButton = {
        var btn = UIButton()
        btn.setTitle("완료한일 보기", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedCompleteTodo), for: .touchUpInside)
        return btn
    }()
    
    var catButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("고양이", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedCatButton), for: .touchUpInside)
        return btn
    }()
    
    var collectionButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("프로필 컬렉션뷰", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedCollectionButton), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(imageView)
        view.addSubview(checkTodo)
        view.addSubview(completeTodo)
        view.addSubview(catButton)
        view.addSubview(collectionButton)
        
        imageView.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(200)
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
        
        checkTodo.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(imageView.snp.bottom).inset(-Constant.defalutMargin)
        }
        
        completeTodo.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(checkTodo.snp.bottom).inset(-Constant.defalutMargin)
        }
        
        catButton.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(completeTodo.snp.bottom).inset(-Constant.defalutMargin)
        }
        
        collectionButton.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(catButton.snp.bottom).inset(-Constant.defalutMargin)
        }
        
    }
    
    @objc func tappedCheckTodo() {
        let vc = PostViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }

    @objc func tappedCompleteTodo() {
        let vc = CompleteViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }

    @objc func tappedCatButton() {
        let vc = CatViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }

    @objc func tappedCollectionButton() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
