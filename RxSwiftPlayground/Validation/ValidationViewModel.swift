import RxSwift

struct ValidationViewModel {
    
    var loginID = Variable<String>("")
    var password = Variable<String>("")
    
    var validLoginID: Observable<Bool> {
        return loginID.asObservable()
            .map { $0.characters.count >= 5 }
            .shareReplayLatestWhileConnected()
    }
    var validPassword: Observable<Bool> {
        return password.asObservable()
            .map { $0.characters.count >= 5 }
            .shareReplayLatestWhileConnected()
    }
    var canLogin: Observable<Bool> {
        return Observable.combineLatest(validLoginID, validPassword) { v1, v2 -> Bool in
            return v1 && v2
        }
    }

}
