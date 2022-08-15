//
//  ViewControllerExtension.swift
//  ByteCoin
//
//  Created by Василий Пивоваров on 16.08.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

// MARK: CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, data: CoinModel) {
            DispatchQueue.main.async {
                self.bitcoinLabel.text = String(format: "%.2f", data.rate)
            }
        
        func didFailWithError(error: Error) {
            print(error)
            self.bitcoinLabel.text = "..."
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
        self.bitcoinLabel.text = "..."
    }
}

// MARK: UIPicketViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

// MARK: UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        currencyLabel.text = selectedCurrency
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
