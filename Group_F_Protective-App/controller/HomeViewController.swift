//
//  HomeViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-17.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    
    var imgArr = ["Photos", "Password" ,  "Notes" , "Vedio", "Camera","Wallet","Recording"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
             // cell.carname = carname[indexPath.row]
              cell?.image.image = UIImage(named: imgArr[indexPath.row])
              cell?.labletext.text = imgArr[indexPath.row]
              
              return cell!
    }
    }

