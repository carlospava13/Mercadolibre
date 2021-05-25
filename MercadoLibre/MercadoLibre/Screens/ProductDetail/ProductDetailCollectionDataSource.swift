//
//  ProductDetailCollectionDataSource.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 23/05/21.
//

import UIKit
import MLData

final class ProductDetailCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [String] = []
    
    func set(data: [String]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as? ProductDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.url = data[indexPath.row]
        return cell
    }
}
 
