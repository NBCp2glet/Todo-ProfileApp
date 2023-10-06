//
//  ProfileViewController.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import SnapKit
import UIKit

class ProfileViewController: UIViewController {
    let viewModel = ProfileViewModel()
    
    var backButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    var userName: UILabel = {
        var label = UILabel()
        label.text = "nabaecamp"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var menuButton: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        btn.imageView?.tintColor = .black
        return btn
    }()
    
    var userPic: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "userPic")
        return view
    }()
    
    lazy var userFollowInfo: UIStackView = {
        var view = UIStackView(arrangedSubviews: [postView, followerView, followingView])
        view.axis = .horizontal
        view.distribution = .equalCentering
        return view
    }()
    
    var postView = UIView()

    var post: UILabel = {
        var label = UILabel()
        label.text = "7"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    var postLabel: UILabel = {
        var label = UILabel()
        label.text = "post"
        label.textAlignment = .center
        return label
    }()
    
    var followerView = UIView()

    var follower: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    var followerLabel: UILabel = {
        var label = UILabel()
        label.text = "follower"
        label.textAlignment = .center
        return label
    }()
    
    var followingView = UIView()

    var following: UILabel = {
        var label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    var followingLabel: UILabel = {
        var label = UILabel()
        label.text = "following"
        label.textAlignment = .center
        return label
    }()
    
    var userNickName: UILabel = {
        var label = UILabel()
        label.text = "르탄이"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var userIntroduce: UILabel = {
        var label = UILabel()
        label.text = "iOS Developer 🍎"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var userLink: UILabel = {
        var label = UILabel()
        label.text = "spartacodingclub.kr"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
   
    lazy var middleBar: UIStackView = {
        var view = UIStackView(arrangedSubviews: [followButton, messageButton])
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fillEqually
        return view
    }()
    
    var followButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Follow", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    var messageButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Message", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.systemGray.cgColor
        btn.layer.borderWidth = 1
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    var moreButton: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.systemGray.cgColor
        btn.layer.borderWidth = 1
        btn.imageView?.tintColor = .black
        return btn
    }()
    
    var gridButton: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: "Grid"), for: .normal)
        var configuration = UIButton.Configuration.plain()
        let inset: CGFloat = 10
        configuration.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        btn.configuration = configuration
        return btn
    }()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        let rowCount: CGFloat = 3
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / rowCount) - 2, height: (UIScreen.main.bounds.width / rowCount) - 2)
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 2
        return collectionView
    }()
    
    var navProfile: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(systemName: "person.fill")
        return view
    }()

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setCollectionView()
        addTopBorder(with: UIColor.black, andWidth: CGFloat(2))
    }
    
    // MARK: Function

    func configureUI() {
        view.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        view.addSubview(backButton)
        view.addSubview(userName)
        view.addSubview(menuButton)
        view.addSubview(userPic)
        
        view.addSubview(userFollowInfo)
        postView.addSubview(post)
        postView.addSubview(postLabel)
        followerView.addSubview(follower)
        followerView.addSubview(followerLabel)
        followingView.addSubview(following)
        followingView.addSubview(followingLabel)
        
        view.addSubview(userNickName)
        view.addSubview(userIntroduce)
        view.addSubview(userLink)
        
        view.addSubview(middleBar)
        view.addSubview(moreButton)
        
        view.addSubview(gridButton)
        
        view.addSubview(collectionView)
        
        view.addSubview(navProfile)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin*2)
        }
        
        userName.snp.makeConstraints {
            $0.top.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(Constant.defalutMargin*2)
        }
        
        userPic.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).inset(-14)
            $0.leading.equalTo(backButton)
            $0.width.height.equalTo(88)
        }
        
        userFollowInfo.snp.makeConstraints {
            $0.top.equalTo(userName).inset(60)
            $0.leading.equalTo(userPic.snp.trailing).inset(-28)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(28)
            $0.height.equalTo(60)
        }
        
        post.snp.makeConstraints {
            $0.top.equalTo(postView)
            $0.leading.trailing.equalTo(postView).inset(Constant.defalutMargin)
        }
        
        postLabel.snp.makeConstraints {
            $0.top.equalTo(post.snp.bottom)
            $0.leading.trailing.equalTo(postView).inset(Constant.defalutMargin)
            $0.bottom.equalTo(postView)
        }
        
        follower.snp.makeConstraints {
            $0.top.equalTo(followerView)
            $0.leading.trailing.equalTo(followerView).inset(Constant.defalutMargin)
        }
        
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(follower.snp.bottom)
            $0.leading.trailing.equalTo(followerView).inset(Constant.defalutMargin)
            $0.bottom.equalTo(followerView)
        }
        
        following.snp.makeConstraints {
            $0.top.equalTo(followingView)
            $0.leading.trailing.equalTo(followingView).inset(Constant.defalutMargin)
        }
        
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(following.snp.bottom)
            $0.leading.trailing.equalTo(followingView).inset(Constant.defalutMargin)
            $0.bottom.equalTo(followingView)
        }
        
        userNickName.snp.makeConstraints {
            $0.top.equalTo(userPic.snp.bottom).inset(-Constant.defalutMargin*2)
            $0.leading.equalTo(backButton)
            $0.trailing.equalTo(menuButton)
        }
        
        userIntroduce.snp.makeConstraints {
            $0.top.equalTo(userNickName.snp.bottom).inset(-5)
            $0.leading.equalTo(backButton)
            $0.trailing.equalTo(menuButton)
        }
        
        userLink.snp.makeConstraints {
            $0.top.equalTo(userIntroduce.snp.bottom).inset(-5)
            $0.leading.equalTo(backButton)
            $0.trailing.equalTo(menuButton)
        }
        
        middleBar.snp.makeConstraints {
            $0.top.equalTo(userLink.snp.bottom).inset(-Constant.defalutMargin)
            $0.leading.equalTo(backButton)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(userLink.snp.bottom).inset(-Constant.defalutMargin)
            $0.leading.equalTo(middleBar.snp.trailing).inset(-Constant.defalutMargin)
            $0.trailing.equalTo(menuButton)
            $0.width.height.equalTo(30)
        }
        
        gridButton.snp.makeConstraints {
            $0.top.equalTo(middleBar.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(125)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(gridButton.snp.bottom).inset(-3)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        navProfile.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).inset(-Constant.defalutMargin)
            $0.bottom.centerX.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: 0, width: gridButton.frame.width + 4, height: borderWidth)
        gridButton.addSubview(border)
    }
    
    @objc func tappedBackButton() {
        dismiss(animated: false)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getDummyImage().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.collectionViewImage.image = viewModel.getDummyImage()[indexPath.row]
        return cell
    }
}
