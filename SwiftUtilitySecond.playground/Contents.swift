//: Playground - noun: a place where people can play

import UIKit
// MARK: 计算String在指定宽度中的高度
// 测试实例：
// let string = "fdjsaflkdsjajklfjs专家房价疯狂的设计开发力度房间看电视就分开了"
// let size = contentSize(UIFont(name: "HelveticaNeue-Light", size: 13)!, content: string, bound:CGSizeMake(200, 100), lineBreakMode: NSLineBreakMode.ByWordWrapping)
//
//
func contentSize(font: UIFont , content: String , bound:CGSize , lineBreakMode:NSLineBreakMode) -> CGSize {

    // 有两种方法
    //
    //   let options = unsafeBitCast(NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue |
    //   NSStringDrawingOptions.UsesFontLeading.rawValue,
    //   NSStringDrawingOptions.self)
    //
    //
    let options: NSStringDrawingOptions = .UsesLineFragmentOrigin
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineBreakMode = lineBreakMode//.ByCharWrapping//lineBreakMode;//

    let attributes = [NSFontAttributeName:font,
        NSParagraphStyleAttributeName:paragraphStyle.copy()]
    let boundingRect = content.boundingRectWithSize(bound, options: options, attributes:attributes, context:nil)

    return boundingRect.size
}

//class Cell {
//    
//    private(set) var row       = 0
//    private(set) var column = 0
//    
////    func move (x: Int , _ y: Int) {
////        row       += y
////        cloumn += x
////    }
//    func move(x: Int = 0 , y: Int = 100){
//        row         += y
//        column   += x
//    }
//    
//    func moveByX(x: Int) {
//        column += x
//    }
//    
//    func moveByY(y: Int) {
//        row += y
//    }
//    
//    var description: String {
//        get {
//            return "Cell [row=\(row), col=\(column)]"
//        }
//    }
//}
//
//
//var cell = Cell()
//cell.move()
//print(cell.description)
//cell.move(100, y: 100)
//cell.description
//
//var instanceFunc = cell.moveByY
//instanceFunc(35)
//print(cell.description)

//let animals = ["finsh" , "cat" , "chicken" , "dog"]

//func isBeofre(one: String , two: String) -> Bool {
//    return one > two
//}

//let sortedStrings = animals.sort()
//let sortedStrings = animals.sort { (one: String, two: String) -> Bool in
//    return one > two
//}
//let sortedStrings = animals.sort { (one , two) -> Bool in
//    return one > two
//}
//let sortedStrings = animals.sort { (one, two) -> Bool in
//    one > two
//}
//let sortedStrings = animals.sort { (one, two) in
//    one > two
//}
//let sortedStrings = animals.sort ({(one, two) in one > two})
//let sortedStrings = animals.sort({one, two in one > two})
//let sortedStrings = animals.sort({$0 > $1})
//let sortedStrings = animals.sort(){$0 > $1}
//let sortedStrings = animals.sort{$0 > $1}
//let sortedStrings = animals.sort(>)

//var isBefore = {
//    (one: String , two: String) -> Bool in return one > two
//}
//
//let sortedStrings = animals.sort(isBefore)
//print(sortedStrings)


typealias StatesMachineType = () -> Int
func makeStatesMachine(maxState: Int) -> StatesMachineType {
    var currentState: Int = 0
    return {
        currentState++
        if currentState > maxState {
            currentState = 0
        }
        return currentState
    }
}


let currentState = makeStatesMachine(100)
print("currentState==\(currentState())")

typealias tipAndTotalNamed = (tipAmt: Double , total: Double)
//let tipAndTotalNamed = (tipAmt: 4.00 , total: 25.19)


let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1)

func calcTipWithTipPct(tipPct: Double) -> tipAndTotalNamed {
    let tipAmt = subtotal  * tipPct
    let finalTotal = total + tipAmt
    
    return tipAndTotalNamed(tipAmt , finalTotal)
}

let result = calcTipWithTipPct(10)
result.tipAmt
result.total


//protocol Speaker {
//    func Speak()
//}
@objc protocol Speaker {
    func Speak()
    optional func TellJoke()
}


class Vicki: Speaker {
    @objc func Speak() {
        print("Hello, I am Vicki!")
    }
    
    @objc func TellJoke() {
        print("tell joke")
    }
}

class Ray: Speaker {
    @objc func Speak() {
        print("Yo, I am Ray!")
    }
    
    @objc func TellJoke() {
        print("Q: Whats the object-oriented way to become wealthy?")
    }
    
    func WriteTutorial() {
        print("I'm on it!")
    }
}


let vk = Vicki()
vk.Speak()



//class Animal {
//    
//}
//class Dog: Animal, Speaker {
//    @objc func Speak() {
//        print("Woof!")
//    }
//}
//
//let dog = Dog()
//dog.Speak()


var speaker: Speaker
speaker = Ray()
speaker.Speak()
(speaker as! Ray).WriteTutorial()
speaker = Vicki()
speaker.Speak()

(speaker as! Vicki).TellJoke()
speaker.TellJoke?()
//speaker = Dog()
speaker.TellJoke?()


protocol DateSimulatorDelegate {
    func dateSimulateDidStart(sim: DateSimulator , a:Speaker , b:Speaker)
    func dateSimulateDidEnd(sim: DateSimulator, a: Speaker , b:Speaker)
}

class DateSimulator {
    let a:Speaker
    let b:Speaker
    
    var delegate: DateSimulatorDelegate?
    
    init(a:Speaker , b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulateDidStart(self, a: a, b: b)
        print("Off to dinner...")
        a.Speak()
        b.Speak()
        print("Walking back home...")
         a.TellJoke?()
        b.TellJoke?()
        delegate?.dateSimulateDidEnd(self, a: a, b: b)
    }
}


class LogginDateSimulator : DateSimulatorDelegate {
    
    func dateSimulateDidEnd(sim: DateSimulator, a: Speaker, b: Speaker) {
        print("--------------Date ended!---------------")
    }
    func dateSimulateDidStart(sim: DateSimulator, a: Speaker, b: Speaker) {
        print("--------------Date started!--------------")
    }
}

let sim = DateSimulator(a: Vicki(), b: Ray())
sim.delegate = LogginDateSimulator()
sim.simulate()


let userDefaults = NSUserDefaults.standardUserDefaults()
let lastRefreshDate: AnyObject? = userDefaults.objectForKey("LastRefreshDate")
if let date = lastRefreshDate {
    print("\(date.timeIntervalSinceReferenceDate)")
}

print(lastRefreshDate)
if let myDate = lastRefreshDate as? NSDate {
    let timeInterval = myDate.timeIntervalSinceReferenceDate
}

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil//"John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ??  fullName)"

let implicitString: String! = nickName

if let definiteString = implicitString {
    print(definiteString)
}

class Singleton {
    
    // 简单版本
    //static let sharedInstance = Singleton()
    
    // 初始化之前的设置
    static let shareInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
    
}


let single = Singleton()
print(single)


protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct Person: Named , Aged {
    var name: String
    var age : Int
}

func wishHappeyBirthday (celebrator: protocol<Named , Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)")
}

wishHappeyBirthday(Person(name: "Tom", age: 23))

import CoreLocation
struct Venue {
    enum Category: String {
        case Entertainment
        case Food
        case Nightlife
        case Shopping
    }
    
    var name: String
    var coordinates: CLLocationCoordinate2D
    var category: Category
    
    
    init?(attributes: [String : AnyObject]) {
        guard let name = attributes["name"] as? String,
            let coordinates = attributes["coordinates"] as? [String: Double],
            let latitude = coordinates["lat"],
            let longitude = coordinates["lng"],
            let category = Category(rawValue: attributes["category"] as? String ?? "Invalid")
            else {
                return nil
        }
        
        self.name = name
        self.coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.category = category
    }
}

let JSON = "{\"name\": \"Caffe Macs\",\"coordinates\": {\"lat\": 37.330576,\"lng\": -122.029739},\"category\": \"Food\"}"
let data = JSON.dataUsingEncoding(NSUTF8StringEncoding)!
let attributes = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]

let venue = Venue(attributes: attributes)!
print(venue.name)
print(venue.coordinates)


if #available(iOS 9 , OSX 10.10, *) {
    // Use iOS 9 APIs on iOS , and use OS X v10.10 APIs on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}


func minMax(array: [Int]) -> (min: Int , max: Int)? {
    
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin , currentMax)
}
let resultt = minMax([12,33,43,-5,54,36,54,554,4])
if let value = resultt {//minMax([]) {
    print("not nil")
}

func someFunction(firstParameter: Int , secondParameter: Int) {
    print("\(firstParameter) + \(secondParameter) = \(firstParameter + secondParameter)")
}

someFunction(10, secondParameter: 10)

func testFunction(first: Int , _ second: Int , _ third: Float) {
    print("test")
}
testFunction(109, 10, 10)

func testFunction1(first: Int = 10 , _ second: Int = 30) {
    print("first==\(first) , second==\(second)")
}
testFunction1()

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,1,3,5,5,6)

var goodArray: [String] = ["1","2","3"]
var brokenArray: [AnyObject]
var employee: Dictionary<String , AnyObject> = ["FirstName":"larry" , "SecondName":"Rodgers","Salary":65_000.00]
print(employee)

var someValue : Any?
someValue = "String"
if someValue is String {
    print("tt")
} else {
    print("gg")
}


class BasicRequestFactory {
    
    static let shareInstance: BasicRequestFactory = {
        let instance = BasicRequestFactory()
        return instance
    }()
    
    // MARK: - Utility Methods
    func sessionRequest(basicUrl: String , parameters: Dictionary<String, AnyObject>?) -> NSMutableURLRequest? {
        
        if parameters == nil {
            let request = newRequest(basicUrl)
            return request
        }
        else {
            do {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters!, options: NSJSONWritingOptions.PrettyPrinted)
                
                let request = newRequest(basicUrl)
                request.setValue(String(format: "％lu", jsonData.length) , forHTTPHeaderField: "Content-length")
                request.HTTPBody = jsonData
                
                return request
            } catch let error as NSError {
                print("Error: \(error.domain)")
            }
            return nil
        }
    }
    
    // MARK: - Private Methods
    private func newRequest(basicUrl: String) -> NSMutableURLRequest {
        let url = NSURL.init(string: basicUrl)
        let request = NSMutableURLRequest.init(URL: url!, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 30.0)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forKey: "Accept")
        request.setValue("application/json", forKey: "Content-Type")
        
        return request;
    }
}


//func sessionReqeustGet(request: NSMutableURLRequest , completionHandler:(NSData? , NSURLResponse , NSError?) -> Void) {
//    let session = NSURLSession.sharedSession()
//    let task = session.dataTaskWithRequest(request) {
//        (data , response , error) -> Void in
//        if error != nil {
//            completionHandler(nil , response! , error!)
//        } else {
//            completionHandler(data! , response! , nil)
//        }
//    }
//    task.resume()
//}
//
//let url = NSURL(string: "http://192.168.1.199:8080/api/site/sh/getWaitingGrabOrderSiteList")
//let request = NSMutableURLRequest(URL: url!)
//sessionReqeustGet(request) { (data, response, error) -> Void in
//    if error != nil {
//        print(error?.description)
//    }
//    else {
//        print(data)
//    }
//}

class Cell {
    private(set) var row = 0
    private(set) var column = 0
    
    func move(row x: Int , colum y: Int) {
        row += x
        column += y
    }
    
    func moveByX(row x: Int) {
        column += x
    }
    
    func moveByY(colum y:Int) {
        row += y
    }
    
    var description: String {
        get {
            return "Cell [row=\(row) , col=\(column)]"
        }
    }
}

var cell = Cell()
cell.move(row: 10, colum: 20)
var moveFunc = cell.moveByX
moveFunc(row: 10)
print(cell.description)


//let animals = ["bird" , "fish" , "cat" , "chicken" , "dog"]
//func isBefore (one: String , two: String) -> Bool {
//    return one > two
//}
//let sortedStrins = animals.sort(isBefore)
//print(sortedStrings)

//let sortedStrings = animals.sort { (one, two) -> Bool in
//    return one > two
//}
//print(sortedStrings)

//let sortedStrings = animals.sort({
//    (one: String , two: String) -> Bool in
//    return one > two
//    })

typealias TotalSum = (numbers: Double ...) -> Double
func makeTotal(numbers: Double ...) -> TotalSum {
    var total:Double = 0
    return {TotalSum in
        for number in numbers {
            total += number
        }
        return total
    }
}

let totaltip = makeTotal(10,10,80,3,20)
print(totaltip())




class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var john: Customer?
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_4567_0394_3456, customer: john!)
john =  nil


var testDictionary = [String:String]()
testDictionary["test1"]  = "value1"
print(testDictionary)

let text = "Swift"
let paddedText = text.stringByPaddingToLength(10, withString: ".", startingAtIndex: 0)
print(paddedText)

for index in 1..<3 {
    print(index)
}

for index in 1...3 {
    print(index);
}

var index = 0
while index < 5 {
    index++
}

index = 0
repeat {
    index++
} while index < 5

let temperature = 45
if temperature > 60 {
    print("It's hot!")
} else if temperature > 40 {
    print("It's warm.")
} else {
    print("It's chilly.")
}

// tulpes
let tuple = (1,3,5)
let tuple2 = (1,5.0)
let tuple3: (Double , Double) = (5, 6)

print(tuple.0)
print(tuple2.0)
print(tuple2.0)

let product = (id: 24 , name:"Swift Book")
print(product.name)

let (x, y, z) = tuple
print((x , y))

// array
//let empty1 = [String]()
//let empty2:[String] = []
//let empty3 = Array<String>()
//
//let animals2 = ["cat" , "dog" , "chicken"]
//
//var mutableAnimals: [String] = ["cat" , "dog" , "chicken"]
//mutableAnimals.append("duck")
//mutableAnimals.removeAtIndex(2)
//print(mutableAnimals)
//mutableAnimals.contains("dog")
//
//let oneAnimal = mutableAnimals.map { $0.uppercaseString }
//print(oneAnimal)
//func checkAnimals(str: String) -> Bool {
//    if str.hasPrefix("c") {
//        return true
//    }
//    return false
//}
//mutableAnimals.filter(checkAnimals)
//let sortAnimals = mutableAnimals.sort{$0 > $1}
//print(sortAnimals)
//
//let nsArray = mutableAnimals as NSArray
//nsArray.objectAtIndex(2)



//let empty1 = [Int:String]()
//let empty2 = Dictionary<Int,String>()
//let empty3 :[Int: String] = [:]
//
//let animals = [24:"cat" , 36:"dog"]
//
//var mutableAnimals : [Int : String] = [24:"cat" , 36:"dog"]
//mutableAnimals[55] = "fish"
//mutableAnimals[24] = "chicken"
//
////animals[24]
//animals[1]
//animals.count
////mutableAnimals.removeValueForKey(24)
//
//animals[24]!.hasPrefix("c")
//
//for (key , value) in animals {
//    print(key)
//    print(value)
//}


//var maybeString: String?
//maybeString = nil
//maybeString = "fish"
//
//if let unwrappedString = maybeString {
//    print(unwrappedString.hasPrefix("f"))
//} else {
//    print("maybeString is nil")
//}
//
//if maybeString!.hasPrefix("f") {
//    print("maybeString starts with 'f'")
//}
//
//if let hasPrefix = maybeString?.hasPrefix("f") {
//    if hasPrefix {
//        print("maybeString starts with 'f'")
//    }
//}
//
//var anOptional: Int?
//var coalesced = anOptional ?? 3

//// implicitly unwrapped optionals
//var maybeString: String!
//maybeString = nil
////maybeString = "fish"
//
//if maybeString.hasPrefix("f") {
//    print("maybeString starts with 'f'")
//} else {
//    print("maybeString does not start with an 'f'")
//}

//let bit = Bit.Zero
//switch bit {
//case .Zero:
//    print("zero")
//case .One:
//    print("one")
//}
//
//let time = 45
//switch time {
//case 0..<60:
//    print("A few seconds ago")
//case 60..<(60 * 4):
//    print("A few minutes ago")
//default:
//    print("Ages ago!")
//}
//
//let boardLocation = (2, 5)
//switch boardLocation {
//case (3,4),(3,3),(2,3),(4,4):
//    print("central location")
//case (let x, let y):
//    print("\(x), \(y) is not in the center")
//}


enum Direction {
    case North, South, East, West
}

//var direction = Direction.North
//direction = .South
//
//switch direction {
//case .North:
//    print("Going North")
//default:
//    print("Going someplace else!")
//}
//
//// advanced enumerations - using generics
//enum Result<T> {
//    case Failure
//    // enumeration member with associated value 
//    case Success(T)
//}
//
//// creating an instance - where the type T is an Int
//var enumResult = Result.Success(22)
//enumResult = .Failure
//// switching and extracting the associated value
//switch enumResult {
//case .Failure:
//    print("Operation failed")
//case .Success(let value):
//    print("Operation returned value \(value)")
//}


//func voidFunc(message: String) {
//    print(message)
//}
//
//voidFunc("Hello, Swift!")
//
//func multiply(D1 arg1: Double ,D2 arg2: Double) -> Double {
//    return arg1 * arg2
//}
//let doubleResult = multiply(D1: 10, D2: 20)
//
//func multiplyTwo(first first: Double , andSecond second: Double) -> Double {
//    return first * second
//}
//multiplyTwo(first: 20, andSecond: 30)
//
//// in-out parameters
//func square(inout number: Double) {
//    number *= number
//}
//var number = 4.0
//square(&number)
//print(number)
//
//// function types
//let myFunc: (Double, Double) -> Double = multiplyTwo
//
//// a generic function
//func areEqual<T: Equatable>(op1:T , op2:T) -> Bool {
//    return op1 == op2
//}


//// closures
//let animals = ["fish" , "cat" , "chicken" , "dog"]
//
//let sortAnimals = animals.sort({
//    (one: String , two: String) -> Bool in
//    return one > two
//})
//animals.sort({
//    (one, two) in return one < two
//})
//
//animals.sort({
//    one, two in return one < two
//})
//
//animals.sort({
//    one, two in one > two
//})
//
//animals.sort({
//    $0 < $1
//})
//
//let r2 = animals.sort() { $0 > $1}
//let r1 = animals.sort {$0 < $1}
//
//print("animals sorted : \(sortAnimals)")
//print("animals sorted : \(r2)")
//print("animals sorted : \(r1)")


//public class BaseClass {
//    private let id: Int // private constant property
//
//    init(id: Int) {
//        self.id  = id
//    }
//}

//protocol NamedType {
//    // a property with a getter
//    var name: String { get }
//}
//
//public class Animal: BaseClass , NamedType {
//    private(set) var name: String // variable with public getter
//                                                  //  and private setter
//    
//    var size: Double = 45.0        // implicit internal property
//    public let fullName: String    // public constant property
//    
//    init(id: Int , name: String , fullName: String) {
//        // all properties initialized before base init invoked
//        self.name = name;
//        self.fullName = fullName;
//        
//        // super initializer invoked
//        super.init(id: id)
//    }
//}
//
//var animal = Animal(id: 24, name: "cat", fullName: "Felis catus")
//print(animal.id)


let label = UILabel(frame: CGRectMake(0,0,100,20))
label.numberOfLines = 0
label.text = "this is test!"
label.backgroundColor = UIColor.redColor()

// MARK: -创建自定义的attributed字符串
// 可能会有内存溢出情况
func createCustomAttributedString(strInfoArr infoArr:NSArray , textAlignment alignment:NSTextAlignment , lineSpace space:CGFloat) -> NSAttributedString {
    
    let mStr = NSMutableString()
    
    let count = infoArr.count
    infoArr.enumerateObjectsUsingBlock { (obj, idx, NULL) -> Void in
        let str = obj as! String
        if idx >= count {
            mStr.appendFormat("%@", str)
        } else {
            mStr.appendFormat("%@\n", str)
        }
    }
    
    let attributedString = NSMutableAttributedString.init(string: mStr as String)
    let paragraphStyle = NSMutableParagraphStyle.init()
    paragraphStyle.alignment = alignment
    paragraphStyle.lineSpacing = space
    attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange.init(location: 0, length: mStr.length))
    
    var startIndex = 0
    infoArr.enumerateObjectsUsingBlock { (obj , idx, NULL) -> Void in
        let str = obj["String"] as! NSString
        let font = obj["Font"] as! UIFont
        let color = obj["Color"] as! UIColor
        
        // 判断是否需要第二次分解
        let secondInfo = obj["SecondSepeator"] as! NSDictionary
        let isNeed = secondInfo["isNeed"] as! Bool
        if isNeed  {
            
        }
        else {
            let length = str.length
            attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(startIndex, length))
            attributedString.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(startIndex, length))
            startIndex += (length + 1)
        }
    }
    
    return attributedString
}

func systemSupprotFont () {
  for name in UIFont.familyNames() {
    print(name)
    if let nameString: String? = name {
      print("Support Font:\(UIFont.fontNamesForFamilyName(nameString!))")
    }
  }
}

systemSupprotFont()
