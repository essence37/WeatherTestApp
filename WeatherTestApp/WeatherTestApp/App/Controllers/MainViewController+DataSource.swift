//
//  MainViewController+DataSource.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 05.03.2021.
//

import UIKit

extension MainViewController {
    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        searchResultsController = SearchResultsController()
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController?.searchResultsUpdater = self
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        // Set up searchController parameters.
        searchController?.searchBar.placeholder = "Search Cities"
        searchResultsController.delegate = self
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Weather> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item.geo_object.locality.name
            content.secondaryText = "\(item.fact.temp)°C | \(item.fact.condition)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Weather>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Weather) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
    
    // initial data
    func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Weather>()
        snapshot.appendSections([.main])
        weather.sort { $0.geo_object.locality.name < $1.geo_object.locality.name }
        snapshot.appendItems(weather)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
