//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Dotshape Dev on 04/10/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell", for: indexPath) as! PictureCollectionViewCell
        cell.setPicture(pic: pictures[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let resultingHeight = 250 + 16
        let newHeight = Int(getHeight(text: pictures[indexPath.item].title, font: .systemFont(ofSize: 14), width: (collectionView.bounds.size.width / 2) - 5)) + resultingHeight
        
        return CGSize(width: (collectionView.bounds.size.width / 2) - 5, height: CGFloat(Float(newHeight)))
    }
    
    func getHeight(text: String, font: UIFont, width: CGFloat) -> CGFloat {
      let attributes: [NSAttributedString.Key: Any] = [
        .font: font
      ]
      let attributedText = NSAttributedString(string: text, attributes:
        attributes)
      let constraintBox = CGSize(width: width, height:
        .greatestFiniteMagnitude)
      let textHeight = attributedText.boundingRect(
        with: constraintBox, options: [.usesLineFragmentOrigin,
        .usesFontLeading], context: nil)
        .height.rounded(.up)
      return textHeight
      }
    
        
}
