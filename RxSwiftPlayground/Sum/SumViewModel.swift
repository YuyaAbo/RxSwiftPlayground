import RxSwift

struct SumViewModel {

    var num1 = Variable<String>("")
    var num2 = Variable<String>("")
    var num3 = Variable<String>("")
    
    var sum: Observable<Int> {
        return Observable.combineLatest(
            num1.asObservable(),
            num2.asObservable(),
            num3.asObservable()
        ) { (n1, n2, n3) -> Int  in
            return (Int(n1) ?? 0) + (Int(n2) ?? 0) + (Int(n3) ?? 0)
        }
    }
}
