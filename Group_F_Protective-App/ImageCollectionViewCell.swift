//
//  ImageCollectionViewCell.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-19.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    override func prepareForReuse() {
          super.prepareForReuse()
          self.imageView.image = nil
      }
}
