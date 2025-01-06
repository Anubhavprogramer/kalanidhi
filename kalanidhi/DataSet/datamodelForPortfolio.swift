//
//  datamodelForPortfolio.swift
//  kalanidhi
//
//  Created by Anubhav Dubey on 30/12/24.
//

import Foundation


struct YourPortfolioHomePageCard: Codable {
    let Image: String
    let cost: Int
    let rate: Int
    
    init(Image: String, cost: Int, rate: Int) {
        self.Image = Image
        self.cost = cost
        self.rate = rate
    }
}

let YourPortfolioHomePageCardData: [YourPortfolioHomePageCard] = [
    YourPortfolioHomePageCard(Image: "image1", cost: 100, rate: 10),
    YourPortfolioHomePageCard(Image: "image2", cost: 200, rate: 20),
    YourPortfolioHomePageCard(Image: "image1", cost: 300, rate: 30),
]

//i am an update

