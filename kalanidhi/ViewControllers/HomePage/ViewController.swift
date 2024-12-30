import UIKit

private let paintings = ["image1", "image2", "image1", "image1"]

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
   
    

    @IBOutlet var YourPortfolio: UICollectionView!
    @IBOutlet var mySearchBar: UISearchBar!
    @IBOutlet var YourPortfolioLabel: UIStackView!
    
    
//    MARK: Member Variables
    
    let reuseIdentifierForPortfolio = "YourPortfolio"
    let spacing: CGFloat = 10
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Paintings array count: \(paintings.count)")
        
        // Set up collection view
        
        setupYourPortfolio()
       
    }
    
//    MARK: Subordimnate Functions
    
    func setupYourPortfolio() {
        YourPortfolio.delegate = self
        YourPortfolio.dataSource = self
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 200)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = .horizontal
        
        YourPortfolio.collectionViewLayout = layout
        YourPortfolio.backgroundColor = .clear
        
        let nib = UINib(nibName: "YourProtfolioCollectionViewCell" , bundle: nil)
        YourPortfolio.register(nib, forCellWithReuseIdentifier: reuseIdentifierForPortfolio)
    }
    
//    MARK: Protocols
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForPortfolio , for: indexPath) as! YourProtfolioCollectionViewCell
        
        cell.xibPainting.image = UIImage(named: paintings[indexPath.row])
        cell.xibPainting.layer.cornerRadius = 18
        cell.xibPainting.layer.masksToBounds = true
        
        return cell
    }
    
}
