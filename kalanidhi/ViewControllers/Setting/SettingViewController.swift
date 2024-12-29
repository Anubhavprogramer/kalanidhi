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
    
//    var profileSettings = ["Edit Name" : "Sanjh Arora", "Edit User Name" : "@Sanjh_Arora", "About" : "Inspirational designs"]
//    var accountSettings = ["Change Password": "*****", "Two-Factor Authentication": "Enabled", "Email": "SanjhArora@gmail.com", "Phone": "+91 9876543210"]
//    var currencySetting = ["Set Default Currency": "USD", "Set Default Language": "English"]
//    
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
        let setting: Setting
        
        switch indexPath.section{
        case 0:
            setting = profileSettings[indexPath.row]
        case 1:
            setting = accountSettings[indexPath.row]
        case 2:
            setting = generalSetting[indexPath.row]
        default:
            fatalError("Invalid section")
        }
        
//        let label = cell.viewWithTag(18) as? UILabel
        cell.textLabel?.text = setting.title
        
        switch setting.inputType {
        case .textField:
            let valueLabel = UILabel(frame: CGRect(x:cell.contentView.frame.width - 150,y: 0,width: 150,height: cell.contentView.frame.height))
            valueLabel.textAlignment = .right
            valueLabel.text = setting.value
            valueLabel.textColor = .gray
            cell.contentView.addSubview(valueLabel)
        case .secureTextField:
            let secureLabel = UILabel(frame: CGRect(x:cell.contentView.frame.width - 150, y: 0,width: 140, height: cell.contentView.frame.height))
            secureLabel.textAlignment = .right
            secureLabel.textColor = .gray
            cell.contentView.addSubview(secureLabel)
        case .toggleSwitch:
            let toggleSwitch = UISwitch(frame: CGRect(x: cell.contentView.frame.width - 60, y: (cell.contentView.frame.height - 31)/2, width: 60, height:0))
            toggleSwitch.isOn = (setting.value == "Enabled")
            toggleSwitch.tag = indexPath.section * 100 + indexPath.row
            toggleSwitch.addTarget(self, action: #selector(toggleSwitchChanged(_:)), for: .valueChanged)
            cell.contentView.addSubview(toggleSwitch)
            
        }
        
//        tableView.layer.cornerRadius = 17
//        cell.layer.cornerRadius = 17
        
        return cell
        
    }
    
    @objc func toggleSwitchChanged(_ sender: UISwitch) {
        let section = sender.tag
        let row = sender.tag % 100
        
        switch section {
        case 0:
            break
            
        case 1:
            break
            
        case 2:
            break
            
        default:
            break
        }
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
        
        var setting: Setting = Setting(title: "", value: "", inputType: .textField)
        
        switch indexPath.section {
        case 0:
            setting = profileSettings[indexPath.row]
            
        case 1:
            setting = accountSettings[indexPath.row]
        case 2:
            setting = generalSetting[indexPath.row]
        default:
            break
        }
        
        if setting.inputType == .secureTextField{
            showSecureTextInput(for: setting, section: indexPath.section, row: indexPath.row)
        }
        else {
            showPopup(for: setting, section: indexPath.section, row: indexPath.row)
        }
    }
    
    func showSecureTextInput(for setting: Setting, section: Int, row: Int){
        let alertController = UIAlertController(
            title: "Update \(setting.title)",
            message: "Enter a new Password",
            preferredStyle: .alert
        )
        
        alertController.addTextField{ textField in
            textField.text = setting.value
            textField.placeholder = "New Password"
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
    
    func showPopup(for setting: Setting, section: Int, row: Int){
        let alertController = UIAlertController(
            title: "Update \(setting.title)",
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
            profileSettings[row].value = newValue
            
            case 1:
            accountSettings[row].value = newValue
            
            case 2:
            generalSetting[row].value = newValue
            
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
