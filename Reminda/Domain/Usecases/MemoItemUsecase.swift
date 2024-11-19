//
//  MemoItemUsecase.swift
//  Reminda
//
//  Created by Dung-pc on 31/10/2024.
//

import Foundation
import RxSwift

protocol MemoItemUsecase {
    func insertMemoItem(memoItem: MemoItem) -> Completable
    func getMemoItem(id: String) -> Single<MemoItem>
    func getList() -> Single<[MemoItem]>
    func updateMemoItem(id: String, title: String?, content: String?, category: Int?) -> Completable
    func deleteMemoItem(id: String)  -> Completable
    func deleteAllMemoItem() -> Completable
}
