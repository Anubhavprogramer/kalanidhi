//
//  loginPageViewController.swift
//  kalanidhi
//
//  Created by Batch -2 on 02/01/25.
//

import UIKit

class loginPageViewController: UIViewController {
    
    
    @IBOutlet var apple: UIImageView!
    @IBOutlet var google: UIImageView!
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apple?.layer.cornerRadius = 13
        google?.layer.cornerRadius = 13
        userName.layer.cornerRadius = 13
        password.layer.cornerRadius = 13
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
