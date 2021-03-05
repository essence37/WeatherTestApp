//
//  SearchResultsController.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 26.02.2021.
//

import UIKit

protocol SearchResultsControllerDelegate: class {
  func didSelectItem(_ weather: Weather)
}

class SearchResultsController: UIViewController {
    
    enum Section: Hashable {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Weather>! = nil
    var collectionView: UICollectionView! = nil
    
    weak var delegate: SearchResultsControllerDelegate?
    
    var filteredWeather: [Weather] = [] {
        didSet {
            fetchData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
}

extension SearchResultsController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(filteredWeather[indexPath.item])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
