//
//  CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by Василий Пивоваров on 16.08.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, data: CoinModel)
    func didFailWithError(error: Error)
}
