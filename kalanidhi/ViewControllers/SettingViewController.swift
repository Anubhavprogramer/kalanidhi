//
//  SettingViewController.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 26/12/24.
//

import UIKit

class SettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
//    Table view Cell
    
    
//    @IBOutlet var DetailsLabel: UILabel!
    
    var profileSettings = ["Edit Name" : "Sanjh Arora", "Edit User Name" : "@Sanjh_Arora", "About" : "Inspirational designs"]
    var accountSettings = ["Change Password": "*****", "Two-Factor Authentication": "Enabled", "Email": "SanjhArora@gmail.com", "Phone": "+91 9876543210"]
    var currencySetting = ["Set Default Currency": "USD", "Set Default Language": "English"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return 3
            case 1: return 4
            case 2: return 2
            default: return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        let label = cell.viewWithTag(18) as? UILabel
        
        switch indexPath.section {
        case 0:
            let key = Array(profileSettings.keys)[indexPath.row]
            cell.textLabel?.text = key
            label?.text = profileSettings[key]
        case 1:
            let key = Array(accountSettings.keys)[indexPath.row]
            cell.textLabel?.text = key
            label?.text = accountSettings[key]
        case 2:
            let key = Array(currencySetting.keys)[indexPath.row]
            cell.textLabel?.text = key
            label?.text = currencySetting[key]
        default:
            break
        }
        
        tableView.layer.cornerRadius = 17
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Profile"
        case 1: return "Security"
        case 2: return "Settings"
        default: return nil
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        let row = indexPath.row
        
        var selectedSetting : (key: String, value: String?) = ("", "")
        
        switch section {
        case 0:
            let key = Array(profileSettings.keys)[row]
            selectedSetting = (key, profileSettings[key])
            
        case 1:
            let key = Array(accountSettings.keys)[row]
            selectedSetting = (key, accountSettings[key])
        case 2:
            let key = Array(currencySetting.keys)[row]
            selectedSetting = (key, currencySetting[key])
        default:
            break
        }
        
        showPopup(for: selectedSetting, section: section, row: row)
    }
    
    func showPopup(for setting: (key: String, value: String?), section: Int, row: Int){
        let alertController = UIAlertController(
            title: "Update \(setting.key)",
            message: setting.value,
            preferredStyle: .alert
        )
        
        alertController.addTextField{ textField in
            textField.text = setting.value
            textField.placeholder = "Value"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default){ _ in
            if let newValue = alertController.textFields?.first?.text{
                self.updateValue(newValue, section: section, row:row)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func updateValue(_ newValue: String, section: Int, row: Int){
        switch section{
            case 0:
                let key = Array(profileSettings.keys)[row]
                profileSettings[key] = newValue
            
            case 1:
                let key = Array(accountSettings.keys)[row]
                accountSettings[key] = newValue
            
            case 2:
                let key = Array(currencySetting.keys)[row]
                currencySetting[key] = newValue
            
            default:
                break
        }
        
        settingsTableView.reloadData()
    }
    
    
    
//    Outlets
    @IBOutlet var userProfilePicture: UIImageView!
    @IBOutlet var settingsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsTableView.layer.cornerRadius = 17.0
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func EditButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Profile", message: nil, preferredStyle: .actionSheet)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Take a Photo", style: .default, handler: {action in imagePicker.sourceType = .camera
                self.present(imagePicker,animated: true, completion: nil)
            })
            
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoAction = UIAlertAction(title: "Choose From Liberary", style: .default, handler: {action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker,animated: true, completion: nil)
            })
            
            alertController.addAction(photoAction)
        }
        
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        userProfilePicture.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }


}
