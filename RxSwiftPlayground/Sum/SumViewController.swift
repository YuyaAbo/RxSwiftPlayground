import UIKit
import RxSwift
import RxCocoa

class SumViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = SumViewModel()

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var sum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        number1.rx.text.orEmpty.bindTo(viewModel.num1).addDisposableTo(disposeBag)
        number2.rx.text.orEmpty.bindTo(viewModel.num2).addDisposableTo(disposeBag)
        number3.rx.text.orEmpty.bindTo(viewModel.num3).addDisposableTo(disposeBag)
        
        viewModel.sum
            .map { $0.description }
            .bindTo(sum.rx.text)
            .disposed(by: disposeBag)
    }

}

