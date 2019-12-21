import UIKit

/* Карьера программиста 1.1 */
var str: String = "H"

func isRecur(in string: String) -> Bool {
    if string.count == 0 {
        return false
    }
    var i = string.index(string.startIndex, offsetBy: 1)
    while i != string.endIndex {
        var j = string.startIndex
        while j != string.endIndex {
            if i == j {
                if j != string.endIndex {
                    j = string.index(after: j)
                }
            }
            if i != string.endIndex && j != string.endIndex && string[i] == string[j] {
                print(string[j])
                return true
            }
            if j != string.endIndex {
                j = string.index(after: j)
            }
        }
        i = string.index(after: i)
    }
    return false
}

isRecur(in: str)

/* */


/* Карьера программиста 1.2 */
func isTranspositionSort(str1: String, str2: String) -> Bool {
    return str1.sorted() == str2.sorted()
}

isTranspositionSort(str1: "abbc", str2: "bbca")

func isTranspositionCount(str1: String, str2: String) -> Bool {
    if str1.count != str2.count {
        return false
    }
    var letters = Array(repeating: 0, count: 128)
    
    for i in str1.utf8 {
        letters[Int(i)] += 1
    }
    for i in str2.utf8 {
        letters[Int(i)] -= 1
        if letters[Int(i)] < 0 {
            return false
        }
    }
    return true
}

isTranspositionCount(str1: "abc", str2: "ca")

/* */

/* Карьера программиста 1.3 */

func changeSpace(str: String, length: Int) -> String {
    let len: Int
    if length > str.count {
        len = str.count
    } else {
        len = length
    }
    var i = str.startIndex
    var string = ""
    var j = string.startIndex
    for _ in 0..<len {
        if str[i] == " " {
            string.append("%20")
            j = string.endIndex
        } else {
            string.insert(str[i], at: j)
            j = string.index(after: j)
        }
        i = str.index(after: i)
    }
    return string
}

changeSpace(str: "Hello, how are you?", length: 17)

/* */

/* Карьера программиста 1.4 */

func isPalindrome(_ str: String) -> Bool {
    var temp = str
    var string = ""
    var i = temp.index(before: temp.endIndex)
    while i != temp.startIndex {
        if temp[i] != " " {
            string.append(temp[i])
        } else {
            temp.remove(at: i)
        }
        i = temp.index(before: i)
    }
    string.append(temp[i])
    if string.lowercased() == temp.lowercased() {
        return true
    }
    return false
}

isPalindrome("radar")

/* */


/* Карьера программиста 1.5 */

func mostOneModi(str1: String, str2: String) -> Bool {
    if str1 == str2 {
        return true
    }
    let difference = abs(str1.count - str2.count)
    if difference > 1 {
        return false
    }
    var string1: String
    var string2: String
    if str1.count > str2.count {
        string1 = str1
        string2 = str2
    } else {
        string1 = str2
        string2 = str1
    }
    var counter = 0
    var i = string1.startIndex
    var j = string2.startIndex
    while i != string1.endIndex {
        if string1[i] == string2[j] {
            i = string1.index(after: i)
            if j != string2.index(before: string2.endIndex) {
                j = string2.index(after: j)
            }
        } else if string1[i] != string2[j] && difference == 1 {
            counter += 1
            i = string1.index(after: i)
        } else {
            counter += 1;
            i = string1.index(after: i)
            j = string2.index(after: j)
        }
    }
    if counter > 1 {
        return false
    }
    return true
}

mostOneModi(str1: "pale", str2: "pale")

/* */


/* Карьера программиста 1.6 */

func squeezeData(str: String) -> String {
    if str.count == 0 {
        return ""
    }
    var string = ""
    string.append(str[str.startIndex])
    var i = str.index(after: str.startIndex)
    var counter = 1
    while i != str.endIndex {
        if str[i] != string[string.index(before: string.endIndex)] {
            string.append(String(counter))
            string.append(str[i])
            counter = 1
        } else {
            counter += 1
        }
        i = str.index(after: i)
    }
    string.append(String(counter))
    if str.count < string.count {
        return str
    }
    return string
}

squeezeData(str: "aaaaabbbbbtttttssss")

/* */

/* Карьера программиста 1.7 */

var matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]


func rotate(image: [[Int]]) {
    var j = image[0].count - 1
    while j != -1 {
        for pixel in image {
            print(pixel[j], terminator: " ")
        }
        j -= 1
        print("\n")
    }
}

//rotate(image: matrix)

/* */


/* Карьера программиста 1.8 */

var zeroMatrix = [[1, 0, 3, 0],
                  [4, 1, 6, 2],
                  [7, 8, 9, 0]]

func zeroRowColumn(matrix: [[Int]]) -> [[Int]] {
    var rows = Array(repeating: false, count: matrix.count)
    var columns = Array(repeating: false, count: matrix[0].count)
    for (i, row) in matrix.enumerated() {
        for (j, elem) in row.enumerated() {
            if elem == 0 {
                rows[i] = true
                columns[j] = true
            }
        }
    }
    var modiMatrix = matrix
    for (i, row) in matrix.enumerated() {
        for (j, _) in row.enumerated() {
            if (rows[i] == true || columns[j] == true) {
                modiMatrix[i][j] = 0
            }
        }
    }
    return modiMatrix
}

zeroRowColumn(matrix: zeroMatrix)

/* */


/* Карьера программиста 1.9 */

func checkForStringShift(str1: String, str2: String) -> Bool {
    let string = str1 + str1
    if string.contains(str2) {
        return true
    }
    return false
}

checkForStringShift(str1: "hello", str2: "lohel")

/* */

/* Карьера программиста 2.1 */

func removeDuplicates<T: Equatable>(in list: LinkedList<T>) -> LinkedList<T> {
    var temp = list
    var readyList = LinkedList<T>()
    readyList.append(temp.head!.value)
    temp.removeAll(temp.head!.value)
    while temp.head != nil {
        readyList.append(temp.head!.value)
        temp.removeAll(temp.head!.value)
    }
    return readyList
}

/* */

/* Карьера программиста 2.2 */

func findLastIndex<T>(in list: LinkedList<T>, at index: Int) -> Node<T> {
    let lastIndex = list.count - (index + 1)
    if lastIndex >= 0 {
        return list.node(at: lastIndex)!
    }
    return list.node(at: 0)!
}

/* */

/* Карьера программиста 2.3 */

func deleteMiddleNode<T>(in list: inout LinkedList<T>) {
    var count = 0
    var firstPtr = list.head
    var secondPtr = firstPtr
    while firstPtr?.next?.next != nil {
        firstPtr = firstPtr?.next?.next
        secondPtr = secondPtr?.next
        count += 1
    }
    list.node(at: count - 1)?.next = secondPtr?.next
    list.count -= 1
}

/* */

/* Карьера программиста 2.4 */

func splitList<Value: Comparable>(with value: Value, in list: LinkedList<Value>) -> LinkedList<Value> {
    var lowList = LinkedList<Value>()
    var highList = LinkedList<Value>()
    var current = list.head
    while current != nil {
        if current!.value < value {
            lowList.append(current!.value)
        } else {
            highList.append(current!.value)
        }
        current = current?.next
    }
    lowList.tail?.next = highList.head
    lowList.tail = highList.tail
    return lowList
}

/* */

/* Карьера программиста 2.5 */

func sumLists(firstList: LinkedList<Int>, secondList: LinkedList<Int>) -> LinkedList<Int> {
    var result = LinkedList<Int>()
    var firstValue = ""
    var secondValue = ""
    var firstHead = firstList.head
    var secondHead = secondList.head
    while firstHead != nil && secondHead != nil {
        firstValue = String(firstHead!.value) + firstValue
        secondValue = String(secondHead!.value) + secondValue
        if firstHead != nil {
            firstHead = firstHead?.next
        }
        if secondHead != nil {
            secondHead = secondHead?.next
        }
    }
    let sum = String(Int(firstValue)! + Int(secondValue)!)
    for char in sum {
        result.append(Int(String(char))!)
    }
    return result
}

/* */

/* Карьера программиста 2.6 */

func isPolinList<Value: Comparable>(_ list: LinkedList<Value>) -> Bool {
    var reversedList = LinkedList<Value>()
    var current = list.head
    while current != nil {
        reversedList.push(current!.value)
        current = current?.next
    }
    for (i, j) in zip(list, reversedList) {
        if i != j {
            return false
        }
    }
    return true
}

/* */

/* Карьера программиста 2.7 */

//var list1 = LinkedList<Int>()
//list1.append(1)
//list1.append(2)
//list1.append(3)
//list1.append(4)
//list1.append(5)
//list1.count
//
//var list2 = LinkedList<Int>()
//list2.append(3)
//list2.append(8)
//list2.append(4)
//list2.append(10)
//list2.count
//
//list1.node(at: 1)?.next = list2.node(at: 0)
//
//
//print(list1)
//print(list2)

func findIntersect<Value>(in firstList: LinkedList<Value>, and secondList: LinkedList<Value>) -> Node<Value>? {
    var countFirst = 0
    var countSecond = 0
    var currentFirst = firstList.head
    var currentSecond = secondList.head
    while currentFirst != nil || currentSecond != nil {
        if currentFirst != nil {
            countFirst += 1
        }
        if currentSecond != nil {
            countSecond += 1
        }
        currentFirst = currentFirst?.next
        currentSecond = currentSecond?.next
    }
    currentFirst = firstList.head
    currentSecond = secondList.head
    let diff = abs(countFirst - countSecond)
    var i = 0
    if countFirst > countSecond {
        while i < diff {
            currentFirst = currentFirst?.next
            i += 1
        }
    } else {
        while i < diff {
            currentSecond = currentSecond?.next
            i += 1
        }
    }
    while currentFirst != nil && currentSecond != nil {
        if currentFirst === currentSecond {
            return currentFirst
        }
        currentFirst = currentFirst?.next
        currentSecond = currentSecond?.next
    }
    return nil
}

/* */


/* Карьера программиста 2.8 */

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.append(6)
list.node(at: 5)?.next = list.node(at: 2)
func findLoopElement<Value>(in list: LinkedList<Value>) -> Node<Value>? {
    var fast = list.head
    var slow = list.head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            print("Hey")
            break
        }
    }
    return nil
}

findLoopElement(in: list)
