//
//  MXCollectionViewCell.swift
//  MXDouYuZhiBo
//
//  Created by 刘智援 on 2016/12/5.
//  Copyright © 2016年 lyoniOS. All rights reserved.
//

import UIKit

class MXCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: 数组模型
    var anchorGroups : [MXAnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        flowLayout.minimumLineSpacing       = 0
        flowLayout.minimumInteritemSpacing  = 0
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "MXGameCollectionCell", bundle: nil), forCellWithReuseIdentifier: kGameCollectionCell)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
        flowLayout.itemSize = CGSize.init(width: bounds.size.width * 0.25, height: bounds.size.height * 0.5)
    
    }
}

extension MXCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anchorGroups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCollectionCell, for: indexPath) as! MXGameCollectionCell
        cell.anchorGroup = anchorGroups![indexPath.item]
        return cell
    }
}
