//
//  DetailControllerTests.swift
//  iOSUnitTestingTests
//
//  Created by dmason on 2/7/20.
//

import XCTest
@testable import iOSUnitTesting

class DetailControllerTests: XCTestCase
{
    func testDetailImageViewExists()
    {
        let sut = DetailViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView()
    {
        let sut = DetailViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailImageViewBackgroundColorIsWhite()
    {
        let sut = DetailViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.imageView.backgroundColor, UIColor.white)
    }
    
    func testDetailImageViewContentModeIsAspectFit()
    {
        let sut = DetailViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.imageView.contentMode, .scaleAspectFit)
    }
    
    func testDetailLoadsImage()
    {
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    func testSelectingImageShowsDetail()
    {
        // given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        
        var selectedImage: String?
        let testIndexPath = IndexPath(row: 0, section: 0)
        
        // when
        sut.picturesSelectAction = {
            selectedImage = $0
        }
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        // then
        XCTAssertEqual(selectedImage, "nssl0049.jpg")
    }
    
    func testSelectingImageShowsDetailImage()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        
        let testIndexPath = IndexPath(row: 0, section: 0)
        let filenameToTest = "nssl0049.jpg"
        let imageToLoad = UIImage(named: filenameToTest, in: Bundle.main, compatibleWith: nil)
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        
        sut.picturesSelectAction = {
            let detail = DetailViewController()
            detail.selectedImage = $0
            detail.loadViewIfNeeded()
            
            XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
        
        sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
    }
}
