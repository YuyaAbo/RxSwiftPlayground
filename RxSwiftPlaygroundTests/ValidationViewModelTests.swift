import Quick
import Nimble
import RxBlocking
@testable import RxSwiftPlayground

class ValidationViewModelTests: QuickSpec {
    
    override func spec() {
        describe("ValidationViewModel") {
            var viewModel: ValidationViewModel!
            beforeEach {
                viewModel = ValidationViewModel()
            }
            
            it("validates loginID") {
                viewModel.loginID.value = "YuyaAbo"
                expect(try! viewModel.validLoginID.toBlocking().first()) == true
                viewModel.loginID.value = "Yuya"
                expect(try! viewModel.validLoginID.toBlocking().first()) == false
            }
            
            it("validates password") {
                viewModel.password.value = "12345"
                expect(try! viewModel.validPassword.toBlocking().first()) == true
                viewModel.password.value = "1234"
                expect(try! viewModel.validPassword.toBlocking().first()) == false
            }
            
            it("validates login") {
                viewModel.loginID.value = "YuyaAbo"
                viewModel.password.value = "12345"
                expect(try! viewModel.canLogin.toBlocking().first()) == true
                viewModel.loginID.value = "Yuya"
                viewModel.password.value = "12345"
                expect(try! viewModel.canLogin.toBlocking().first()) == false
                viewModel.loginID.value = "YuyaAbo"
                viewModel.password.value = "123"
                expect(try! viewModel.canLogin.toBlocking().first()) == false
            }
        }
    }
    
}
