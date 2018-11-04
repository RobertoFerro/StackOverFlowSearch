//
//  ViewController.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/10/30.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var viewModel: SearchViewModel = {
        let lazyLoadedViewModel = SearchViewModel(self,SearchRepositoryImplementation())
        return lazyLoadedViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.initalizeViewForPresnetation()
        initalizeTableView()
        inializeSearchBar()
        initalizeNavigationController()
    }
    
    private func initalizeNavigationController() {
        self.navigationItem.titleView = searchController.searchBar
        self.navigationController?.navigationBar.barTintColor = StyleKit.primaryColour()
    }
    
    private func initalizeTableView() {
        tableView.register(UINib(nibName: Constants.postCellNibName, bundle: nil), forCellReuseIdentifier: Constants.postCellIdentifier)
        tableView.backgroundColor = StyleKit.lightGrey()
        tableView.rowHeight = CGFloat(Constants.cellHeight)
    }
    
    private func inializeSearchBar() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.white
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfPosts()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(Constants.spacingBetweenCellHeight)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath) as! PostTableViewCell
        cell.layoutIfNeeded()
        let post = viewModel.post(at:indexPath.section)
        cell.configureCell(with: post)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let post = viewModel.post(at:indexPath.section)
            let detailViewController = DetailViewController(post)
            self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}

extension SearchTableViewController: SearchView {
    
    func showError(_ errorMessage: String) {
        //TODO show an error message to the user
    }
    
    func showSuccess() {
        self.tableView.reloadData()
    }
    
    func showNoPosts() {
        let noDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.text = "noPosts".localized()
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = .center
        self.tableView.backgroundView = noDataLabel
        self.tableView.separatorStyle = .none
    }
    
}

extension SearchTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked( _ searchBar: UISearchBar) {
        viewModel.fetchPosts(for: searchBar.text!)
    }
    
}

