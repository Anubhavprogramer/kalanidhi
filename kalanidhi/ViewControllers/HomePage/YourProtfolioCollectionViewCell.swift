//
//  YourProtfolioCollectionViewCell.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 30/12/24.
//

import UIKit

class YourProtfolioCollectionViewCell: UICollectionViewCell {
    
//  MARK: - Outlets

    @IBOutlet var xibPainting: UIImageView!
    
//    MARK: member variables
    
    private let gradientLayer = CAGradientLayer()
    
//    MARK: viewdidLoad
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
//    MARK: subordinate Fumnctions
//    func updateTheCard(){
//
//    }
    
//
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Calculate the gradient frame to cover the bottom 30% of the image
        let gradientHeight = self.bounds.height * 0.3
        let gradientFrame = CGRect(
            x: 0,
            y: self.bounds.height - gradientHeight,
            width: self.bounds.width,
            height: gradientHeight
        )
        
        // Configure the gradient layer
        gradientLayer.frame = gradientFrame
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.8).cgColor // Darker effect at the bottom
        ]
        gradientLayer.locations = [0.0, 1.0] // Gradual fade from clear to black
        
        // Add the gradient layer to the image view
        if gradientLayer.superlayer == nil {
            xibPainting.layer.addSublayer(gradientLayer)
        }
    }

    
    
    

}
