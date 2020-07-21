//
//  Model.swift
//  Pryaniky
//
//  Created by Anton Larchenko on 20.07.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation

struct Pryanik: Codable {
    let data: [Data]
    let view: [String]
}

struct Data: Codable {
    let name: String
    let data: DataPryanik
}

struct DataPryanik: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}
