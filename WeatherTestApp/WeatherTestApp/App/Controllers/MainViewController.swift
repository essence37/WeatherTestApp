//
//  MainViewController.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    enum Section: Hashable {
        case main
    }
    
    let apiClient = APIClient()
    var subscriptions: Set<AnyCancellable> = []
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Weather>! = nil
    var collectionView: UICollectionView! = nil
    
    // Search results
    var searchResultsController: SearchResultsController!
    var searchController: UISearchController?
    
    var weather: [Weather] = []
    let cities: [City] = [
        City(name: "Moscow", lat: "55.75396", lon: "37.620393"),
        City(name: "Краснодар", lat: "45.055251", lon: "38.999233"),
        City(name: "Санкт-Петербург", lat: "59.946307", lon: "30.354208"),
        City(name: "Абакан", lat: "53.712975", lon: "91.424559"),
        City(name: "Владикавказ", lat: "43.044293", lon: "44.670981"),
        City(name: "Ялта", lat: "44.498960", lon: "34.155582"),
        City(name: "Анапа", lat: "44.888242", lon: "37.324353"),
        City(name: "Норильск", lat: "69.349778", lon: "88.186015"),
        City(name: "Якутск", lat: "62.049291", lon: "129.719635"),
        City(name: "Иваново", lat: "57.001557", lon: "40.965267")
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Weather Test App"
        configureHierarchy()
        configureDataSource()
        fetchData()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        searchResultsController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchResultsController") as? SearchResultsController
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController?.searchResultsUpdater = self
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        // Set up searchController parameters.
        searchController?.searchBar.placeholder = "Search Cities"
//        definesPresentationContext = true
        
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
        snapshot.appendItems(weather)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func fetchData() {
        let _ = cities.publisher
            .sink { city in
                self.apiClient.weather(city: city)
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            self.configureSnapshot()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }, receiveValue: { object in
                        self.weather.append(object)
                    })
                    .store(in: &self.subscriptions)
            }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem(weather[indexPath.item])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // Update the filtered array based on the search text.
        let searchBar = searchController.searchBar
        let searchResults = weather
        let filteredResults = searchResults.filter { (weather: Weather) -> Bool in
            guard searchBar.text != nil else { return false }
            return weather.geo_object.locality.name.lowercased().contains(searchBar.text!.lowercased())
        }
        searchResultsController.filteredWeather = filteredResults
    }
}

extension MainViewController: SearchResultsControllerDelegate {
    func didSelectItem(_ weather: Weather) {
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.weather = weather
        show(vc, sender: self)
    }
}
