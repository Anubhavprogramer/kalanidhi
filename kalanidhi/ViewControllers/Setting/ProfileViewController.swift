//
//  ProfileViewController.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 25/12/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var About: UIView!
    @IBOutlet var cartView: UIView!
    @IBOutlet var favView: UIView!
    @IBOutlet var portfolioCard: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        About.layer.cornerRadius = 17
        cartView.layer.cornerRadius = 17
        favView.layer.cornerRadius = 17
        portfolioCard.layer.cornerRadius = 17

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
