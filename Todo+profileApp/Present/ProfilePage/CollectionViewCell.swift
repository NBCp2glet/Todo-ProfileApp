//
//  CollcetionViewCell.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import SnapKit
import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"

    var collectionViewImage: UIImageView = {
        let Img = UIImageView()
        Img.backgroundColor = .systemGray3
        return Img
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpCell()
    }

    func setUpCell() {
        contentView.addSubview(collectionViewImage)
        collectionViewImage.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(contentView)
        }
    }
}
