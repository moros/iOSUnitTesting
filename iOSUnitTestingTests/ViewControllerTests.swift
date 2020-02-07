//
//  Project1Tests.swift
//  Project1Tests
//
//  Created by dmason on 2/7/20.
//

import XCTest
@testable import iOSUnitTesting

class ViewControllerTests: XCTestCase
{
    private var sut: ViewController!
    
    override func setUp()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller.loadViewIfNeeded()
        
        self.sut = controller
    }
    
    override func tearDown()
    {
        super.tearDown()
        self.sut = nil
    }
    
    func testLoadingImages()
    {
        XCTAssertEqual(self.sut.pictures.count, 10, "There should be ten pictures.")
    }
    
    func testTableExists()
    {
        XCTAssertNotNil(self.sut.tableView)
    }
    
    func testTableViewHasCorrectRowCount()
    {
        let rowCount = self.sut.tableView(self.sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, self.sut.pictures.count)
    }
    
    func testEachCellHasTheCorrectText()
    {
        for (index, picture) in self.sut.pictures.enumerated()
        {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = self.sut.tableView(self.sut.tableView, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, picture)
        }
    }
    
    func testCellsHaveDisclosureIndicators()
    {
        for index in self.sut.pictures.indices
        {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = self.sut.tableView(self.sut.tableView, cellForRowAt: indexPath)
            
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testViewControllerUsesLargeTitles()
    {
        // Since we instantiated the controller directly from the storyboard,
        // our controller needs to injected into a navigation controller
        // for the navigationBar property to come into existence.
        _ = UINavigationController(rootViewController: self.sut)
        
        // Since we already loaded our controller and called loadViewIfNeeded
        // which triggers a call to viewDidLoad in our setup, we need to
        // send a message to viewDidLoad so the prefersLargeTitles will be
        // set appropriately.
        self.sut.viewDidLoad()
        
        XCTAssertTrue(self.sut.navigationController?.navigationBar.prefersLargeTitles ?? false)
    }
    
    func testNavigationBarHasStormViewerTitle()
    {
        XCTAssertEqual(self.sut.title, "Storm Viewer")
    }
}
