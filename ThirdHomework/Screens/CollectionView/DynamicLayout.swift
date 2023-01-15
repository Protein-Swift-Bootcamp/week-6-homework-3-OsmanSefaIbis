//
//  DynamicLayout.swift
//  ThirdHomework
//
//  Created by Sefa İbiş on 15.01.2023.
//

import UIKit

                                                                                                                                                            // MARK: Protocol Declaration
protocol DynamicLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

                                                                                                                                                            // MARK: Class
class DynamicLayout: UICollectionViewLayout {
    
    weak var delegate: DynamicLayoutDelegate?
    
    
}



