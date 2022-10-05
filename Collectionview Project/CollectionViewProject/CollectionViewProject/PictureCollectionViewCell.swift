//
//  PictureCollectionViewCell.swift
//  CollectionViewProject
//
//  Created by Dotshape Dev on 04/10/2022.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setPicture (pic: Pictures) {
        imageView.image = pic.image
        titleLabel.text = pic.title
    }
}
