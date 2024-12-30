import UIKit


class YourProtfolioCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var xibPainting: UIImageView!
    @IBOutlet var price: UILabel!
    @IBOutlet var rate: UILabel!
    
    
    
    
    // MARK: - Member Variables
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
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
        
        // Update the gradient layer frame and properties
        gradientLayer.frame = gradientFrame
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        
        // Ensure gradient layer is added only once
        if gradientLayer.superlayer == nil {
            xibPainting.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    // MARK: - Subordinate Functions
    func setupCell() {
        xibPainting.layer.cornerRadius = 18
        xibPainting.clipsToBounds = true
        xibPainting.contentMode = .scaleAspectFill
    }
    
    func updateTheCard(with data: YourPortfolioHomePageCard) {
        xibPainting.image = UIImage(named: data.Image)
        price.text = "$\(data.cost)"
        rate.text = "\(data.rate)%"
    }
}
