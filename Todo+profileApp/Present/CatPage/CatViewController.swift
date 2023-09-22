//
//  CatViewController.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit
import SnapKit

class CatViewController: UIViewController, NetworkManagerDelegate {
    let viewModel = CatViewModel()
    
    var backButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    var imageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(systemName: "photo")
        return view
    }()
    
    var resetButton: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        btn.addTarget(self, action: #selector(tappedResetButton), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.networkManger.delegate = self
        viewModel.getImage()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        view.addSubview(resetButton)
        view.addSubview(imageView)
        
        backButton.snp.makeConstraints{
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
        
        imageView.snp.makeConstraints{
            $0.center.equalTo(view)
            $0.width.height.equalTo(200)
        }
        
        resetButton.snp.makeConstraints{
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin)
        }
    }
    
    func didReceiveData(_ data: [CatImage]) {
        imageView.load(url: URL(string: data.first!.url)!)
    }
    
    @objc func tappedBackButton() {
        self.dismiss(animated: false)
    }
    
    @objc func tappedResetButton() {
        viewModel.getImage()
    }
}
