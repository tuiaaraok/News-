//
//  Course.swift
//  корона
//
//  Created by Айсен Шишигин on 08/05/2020.
//  Copyright © 2020 Айсен Шишигин. All rights reserved.
//

import Foundation
struct Cash: Decodable {
    let Date: String!
    let Valute: [String : Money]

}

struct Money: Decodable {
    let Name: String?
    let CharCode: String?
    let Value: Double?
    let Previous: Double?
}

let socrValute = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]

struct WebsiteDescription: Decodable {
    let cashs: [Cash]?
    let websiteDescription: String?
    let websiteName: String?
}
