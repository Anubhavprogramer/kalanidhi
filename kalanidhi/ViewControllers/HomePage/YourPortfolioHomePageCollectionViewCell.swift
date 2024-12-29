//
//  YourPortfolioHomePageCollectionViewCell.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 29/12/24.
//

import UIKit

class YourPortfolioHomePageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var PaintingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PaintingImage.layer.cornerRadius = 13
        // Initialization code
    }

}
