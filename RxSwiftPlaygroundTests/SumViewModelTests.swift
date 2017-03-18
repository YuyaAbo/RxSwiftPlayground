import Quick
import Nimble
import RxBlocking
@testable import RxSwiftPlayground

class SumViewModelTests: QuickSpec {
    
    override func spec() {
        describe("SumViewModel") {
            var viewModel: SumViewModel!
            beforeEach {
                viewModel = SumViewModel()
            }

            it("caliculates three variables") {
                viewModel.num1.value = "1"
                viewModel.num2.value = "2"
                viewModel.num3.value = "3"
                expect(try! viewModel.sum.toBlocking().first()) == 6
            }
        }
    }
    
}
