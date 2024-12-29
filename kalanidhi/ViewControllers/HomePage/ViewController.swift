//
//  ViewController.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 29/12/24.
//

import UIKit

private let items = ["image1", "image1", "image1"]

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var YourPortfolio: UICollectionView! = nil
    let spacing: CGFloat = 10
    
    @IBOutlet var mySearchBar: UISearchBar!
    
    @IBOutlet var YourPortfolioLabel: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpYourPortfolio()
        
    }
    
    func setUpYourPortfolio(){
//        config the Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
//        initialize the collection view
        
        YourPortfolio = UICollectionView(frame: .zero, collectionViewLayout: layout)
        YourPortfolio.translatesAutoresizingMaskIntoConstraints = false
        
//        Register the nib
        
        let nib = UINib(nibName: "YourPortfolioHomePageCollectionViewCell", bundle: nil)
        YourPortfolio.register(nib, forCellWithReuseIdentifier: "YourPortfolio")
        
        YourPortfolio.delegate = self
        YourPortfolio.dataSource = self
        
        view.addSubview(YourPortfolio)
        
        NSLayoutConstraint.activate([
            YourPortfolio.topAnchor.constraint(equalTo: YourPortfolioLabel.bottomAnchor, constant: spacing),
            YourPortfolio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            YourPortfolio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            YourPortfolio.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    MARK: - Protocols
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YourPortfolio", for: indexPath) as? YourPortfolioHomePageCollectionViewCell else {
            fatalError("Error has come, please check")
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }

}
