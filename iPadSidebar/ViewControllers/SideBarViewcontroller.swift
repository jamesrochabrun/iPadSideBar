//
//  SideBarViewcontroller.swift
//  iPadSidebar
//
//  Created by James Rochabrun on 6/28/20.
//

import UIKit

final class SideBarViewController: UIViewController {
    
    static let sectionHeaderElementKind = "section-header-element-kind"

    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        
        case list
        
        var description: String {
            switch self {
            case .list: return "List"
            }
        }
    }
    
    @IBOutlet private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, TabsViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout() // 1 Configure the layout
        configureDataSource() // 2 configure the data Source
        applyInitialSnapshots() // 3 Apply the snapshots.
    }
    
    private func configureCollectionViewLayout() {
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section = NSCollectionLayoutSection.list(using: .init(appearance: .sidebar), layoutEnvironment: layoutEnvironment)
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .estimated(200))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: SideBarViewController.sectionHeaderElementKind, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func configureDataSource() {
        /// 1 - header registration
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <CollectionReusableView<ProfileInfoView>>(elementKind: "Header") {
            (supplementaryView, string, indexPath) in
            supplementaryView.subView.configureWith(UserProfileViewModel.stub)
        }
        /// 2 - data source
        dataSource = UICollectionViewDiffableDataSource<Section, TabsViewModel>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: self.configuredOutlineCell(), for: indexPath, item: item)
        }
        /// 3 - data source supplementaryViewProvider
        dataSource.supplementaryViewProvider = { view, kind, index in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: index)
        }
    }
    
    private func configuredOutlineCell() -> UICollectionView.CellRegistration<UICollectionViewListCell, TabsViewModel> {
        
        UICollectionView.CellRegistration<UICollectionViewListCell, TabsViewModel> { cell, indexPath, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = item.icon
            content.imageProperties.tintColor = .white
            cell.contentConfiguration = content
            cell.accessories = [.disclosureIndicator()]
        }
    }
    
    private func applyInitialSnapshots() {
        
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, TabsViewModel>()
        snapshot.appendSections(sections)
        dataSource.apply(snapshot, animatingDifferences: false)
        
        var outlineSnapshot = NSDiffableDataSourceSectionSnapshot<TabsViewModel>()
        outlineSnapshot.append(TabsViewModel.allCases)
        dataSource.apply(outlineSnapshot, to: .list, animatingDifferences: false)
    }
}

