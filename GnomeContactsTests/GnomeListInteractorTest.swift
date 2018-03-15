//
//  GnomeListInteractorTest.swift
//  GnomeContactsTests
//
//  Created by Joan Roig on 7/3/18.
//  Copyright © 2018 Joan Roig. All rights reserved.
//

import XCTest
@testable import GnomeContacts

class GnomeListInteractorTest: XCTestCase {
    
    var interactor: GnomeListInteractor = GnomeListInteractor()
    var fakeEntityManager: FakeGnomeListEntityManager = FakeGnomeListEntityManager()
    var presenter: GnomeListPresenter = GnomeListPresenter()
    let fakeView: FakeGnomeListView = FakeGnomeListView()
    let router: FakeGnomeListRouter = FakeGnomeListRouter()

    override func setUp() {
        super.setUp()

        fakeView.presenter = presenter
        presenter.view = fakeView
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.entityManager = fakeEntityManager
        fakeEntityManager.requestHandler = interactor
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetData() {
        
        // Test the whole communication between all VIPER layers.
        
        fakeView.viewDidLoad()
        let gnome = fakeView.dataReceived?.cities[0].citizens[0]
        XCTAssertTrue(gnome?.name == "Tobus Quickwhistle")
        presenter.showGnomeDetail(gnomeData: gnome!)
        XCTAssertTrue(router.detailRoutingSuccess)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
