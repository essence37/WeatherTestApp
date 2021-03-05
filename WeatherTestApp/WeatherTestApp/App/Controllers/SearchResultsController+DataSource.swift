//
//  SearchResultsController+DataSource.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 05.03.2021.
//

import UIKit

extension SearchResultsController {
    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Weather> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item.geo_object.locality.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Weather>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Weather) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
    
    // initial data
    func fetchData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Weather>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredWeather)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
