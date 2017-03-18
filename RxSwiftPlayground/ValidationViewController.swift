import UIKit
import RxSwift
import RxCocoa

class ValidationViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = ValidationViewModel()
    
    @IBOutlet weak var loginID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginIDValidLabel: UILabel!
    @IBOutlet weak var passwordValidLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginID.rx.text.orEmpty.bindTo(viewModel.loginID).addDisposableTo(disposeBag)
        password.rx.text.orEmpty.bindTo(viewModel.password).addDisposableTo(disposeBag)
        
        viewModel.validLoginID.bindTo(loginIDValidLabel.rx.isHidden).disposed(by: disposeBag)
        viewModel.validPassword.bindTo(passwordValidLabel.rx.isHidden).disposed(by: disposeBag)
        viewModel.canLogin.bindTo(loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        let tapped = loginButton.rx.tap
        tapped.subscribe { _ in print("ログイン") }
            .disposed(by: disposeBag)
    }

}
