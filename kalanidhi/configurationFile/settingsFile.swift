//
//  settingsFile.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 27/12/24.
//

import Foundation

enum InputType{
    case textField
    case secureTextField
    case toggleSwitch
    
}

struct Setting {
    let title: String
    var value: String
    let inputType: InputType
}

var profileSettings: [Setting] = [
    Setting(title: "First Name", value: "Saanj", inputType: .textField),
    Setting(title: "Last Name", value: "Arora", inputType: .textField),
    Setting(title: "User Name", value: "saanh_arora", inputType: .textField),
    Setting(title: "About", value: "Inspirational designs", inputType: .textField),
]

var accountSettings: [Setting] = [
    Setting(title: "Email", value: "saanh@gmail.com", inputType: .textField),
    Setting(title: "Phone Number", value: "9999999999", inputType: .textField),
    Setting(title: "Password", value: "password", inputType: .secureTextField),
    Setting(title: "Two Step Authentication", value: "true", inputType: .toggleSwitch)
]

var generalSetting: [Setting] = [
    Setting(title: "Currency", value: "INR", inputType: .textField),
    Setting(title: "Language", value: "USD", inputType: .textField)
]
