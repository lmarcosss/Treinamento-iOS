//
//  MaquinasViewController.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 23/10/20.
//

import UIKit

class MaquinasViewController: UIViewController {
    
    typealias Presenter = MaquinasPresenterType & UICollectionViewDataSource
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    lazy var presenter: Presenter = MaquinasPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self.presenter
        collectionView.register(R.nib.maquinaCollectionViewCell)
        presenter.telaCarregou()
    }
}

extension MaquinasViewController: MaquinasViewType {
    func recarregarColecao() {
        collectionView.reloadData()
    }
}

extension MaquinasViewController: UICollectionViewDelegateFlowLayout {
    enum ConstantesDeLayout {
        static let alturaDaCelula = 280
        static let larguraDaCelula = 180
        static let espacoEntreOsCards = 5
        static let espacoForaDosCards = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: ConstantesDeLayout.larguraDaCelula, height: ConstantesDeLayout.alturaDaCelula)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(ConstantesDeLayout.espacoEntreOsCards)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(ConstantesDeLayout.espacoForaDosCards)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: <#T##CGFloat#>(ConstantesDeLayout.espacoEntreOsCards), left: <#T##CGFloat#>(ConstantesDeLayout.espacoEntreOsCards), bottom: <#T##CGFloat#>(ConstantesDeLayout.espacoEntreOsCards), right: <#T##CGFloat#>(ConstantesDeLayout.espacoEntreOsCards))
//    }
    
    
}
