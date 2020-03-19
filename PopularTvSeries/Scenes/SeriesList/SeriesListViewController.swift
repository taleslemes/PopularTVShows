//
//  SeriesListViewController.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

private enum CollectionViewLayout {
    static let cellWidth: CGFloat = UIScreen.main.bounds.width - 80
    static let cellHeight: CGFloat = UIScreen.main.bounds.height * 0.45
    static let lineSpacing: CGFloat = 30
    static let insets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
}

final class SeriesListViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let viewModel: SeriesListViewModel
    
    // MARK: Object Lifecycle
    
    init(viewModel: SeriesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SeriesListViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    // MARK: Setup Layout Methods
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .customGreen
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Popular TV Series"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.IBMPlexSans(withWeight: .bold, size: 28)]
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SeriesCVCell", bundle: nil), forCellWithReuseIdentifier: SeriesCVCell.identifier)
    }
    
}

// MARK: CollectionView Interface Implementation

extension SeriesListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCVCell.identifier, for: indexPath) as? SeriesCVCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .systemBlue
        return cell
    }
    
}

extension SeriesListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewLayout.cellWidth, height: CollectionViewLayout.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewLayout.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionViewLayout.insets
    }
    
}

extension SeriesListViewController: UICollectionViewDelegate {
    
}
