import UIKit
import RxSwift
import RxCocoa

class SumViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var sum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.combineLatest(
            number1.rx.text.orEmpty,
            number2.rx.text.orEmpty,
            number3.rx.text.orEmpty
        ) { (num1, num2, num3) -> Int in
            return (Int(num1) ?? 0) + (Int(num2) ?? 0) + (Int(num3) ?? 0)
        }
            .map { $0.description } //sum.rx.textにバインディングするためにStringに
            .bindTo(sum.rx.text)
            .disposed(by: disposeBag)
    }

}

