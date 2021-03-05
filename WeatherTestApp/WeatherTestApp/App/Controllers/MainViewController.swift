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
    let cities: [City] = City.cities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Weather Test App"
        configureHierarchy()
        configureDataSource()
        fetchData()
    }
    
    func fetchData() {
        let _ = cities.publisher
            .flatMap { city in
                return self.apiClient.weather(city: city)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { object in
                self.weather.append(object)
                self.configureSnapshot()
            })
            .store(in: &self.subscriptions)
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
        let vc = DetailViewController()
        vc.weather = weather
        show(vc, sender: self)
    }
}
