//
//  PhotosViewController.swift
//  Group_F_Protective-App
//
//  Created by Simran Chakkal on 2019-11-18.
//  Copyright © 2019 Simran Chakkal. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate ,UICollectionViewDataSource{
    @IBOutlet var Imagecollection: UICollectionView!
    var customImage: customFlowLayout!
    var ImageArr = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
         loadImages()
        customImage = customFlowLayout()
        Imagecollection.collectionViewLayout = customImage
        Imagecollection.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    func loadImages()  {
        ImageArr.append(UIImage(named: "Notes")!)
         ImageArr.append(UIImage(named: "Notes")!)
         ImageArr.append(UIImage(named: "Notes")!)
         ImageArr.append(UIImage(named: "Wallet")!)
         ImageArr.append(UIImage(named: "Photos")!)
        self.Imagecollection.reloadData()
        
    
    }
    @IBAction func chooseimage(_ sender: Any) {
       let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                            self.present(imagePickerController,animated: true, completion: nil)
            }
            else {
                print("Camera not available")
            }
           
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
             self.present(imagePickerController,animated: true, completion: nil)
             }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet,animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        //imageview.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Imagecollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        let image = ImageArr[indexPath.row]
        cell.imageView.image = image
        return cell
        
    }
}
