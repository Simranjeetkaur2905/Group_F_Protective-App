//
//  customFlowLayout.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-19.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class customFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
        
    }
    override var itemSize: CGSize{
        set{}
        get{
            let numberofColumns: CGFloat = 3
            let itemWidth = (self.collectionView!.frame.width - (numberofColumns - 1)) / numberofColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    func setupLayout(){
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }

}
