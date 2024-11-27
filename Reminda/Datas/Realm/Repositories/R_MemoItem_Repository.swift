//
//  RMemoItemRepository.swift
//  Reminda
//
//  Created by Dung-pc on 31/10/2024.
//

import Foundation
import RealmSwift
import RxSwift

struct RMemoItemRepository: MemoItemUsecase {
    
    static let shared: MemoItemUsecase = RMemoItemRepository()
    
    private let realm = RealmPersistent.initializer()
    
    func insertMemoItem(memoItem: MemoItem) -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while saving the MemoItem")

            do {
                let r_MemoItem = RMemoItem()
                r_MemoItem.fromMemoItem(memoItem: memoItem)
                
                try realm?.write {
                    realm?.add(r_MemoItem)
                    
                    observer(.completed)
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func getMemoItem(id: String) -> Single<MemoItem> {
        return Single<MemoItem>.create { observer in
            let maybeError = RealmError(msg: "An error occurred while fetching the MemoItem")
            
            if let MemoItem = realm?.objects(RMemoItem.self).first(where: { $0.id == id }) {
                observer(.success(MemoItem.toMemoItem()))
            } else {
                observer(.failure(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func getList() -> Single<[MemoItem]> {
        return Single<[MemoItem]>.create { observer in
            let maybeError = RealmError(msg: "An error occurred while fetching the categories")
            
            if let categories = realm?.objects(RMemoItem.self) {
                let usersArray: [MemoItem] = categories.map {$0.toMemoItem()}
                observer(.success(usersArray))
            } else {
                observer(.failure(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func updateMemoItem(memoItem: MemoItem) -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while saving the MemoItem")

            do {
                let r_MemoItem = RMemoItem()
                r_MemoItem.fromMemoItem(memoItem: memoItem)
                
                try realm?.write {
                    realm?.add(r_MemoItem, update: .modified)
                    
                    observer(.completed)
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func deleteMemoItem(id: String)  -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while deleting the MemoItem")
            
            do {
                let categories = realm?.objects(RMemoItem.self)
                // Get specific MemoItem by id
                if let memoItem = categories?.first(where: { $0.id == id }) {
                    try realm?.write {
                        realm?.delete(memoItem)
                        observer(.completed)
                    }
                }
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
    
    func deleteAllMemoItem() -> Completable {
        return Completable.create { observer in
            let maybeError = RealmError(msg: "An error occurred while deleting all MemoItem")
            
            do {
                if let memoItem = realm?.objects(RMemoItem.self) {
                    try realm?.write {
                        realm?.delete(memoItem)
                        
                        observer(.completed)
                        return
                    }
                }
                
            } catch {
                observer(.error(maybeError))
            }
            
            return Disposables.create()
        }
    }
}
