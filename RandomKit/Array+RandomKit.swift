//
//  Array+RandomKit.swift
//  RandomKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

extension Array: ShuffleType {

    /// Shuffles the elements in `self` and returns the result.
    public func shuffle() -> Array {
        return indices.reduce(self) { (var array, i) in
            let j = Int.random(startIndex ... endIndex - 1)
            if j != i { (array[i], array[j]) = (array[j], array[i]) }
            return array
        }
    }

}

extension Array where Element: RandomType {

    /// Construct an Array of random elements.
    public init(randomCount: Int) {
        self = Array(Element.randomSequence(maxCount: randomCount))
    }

}

extension Array where Element: RandomIntervalType {

    /// Construct an Array of random elements from inside of the closed interval.
    public init(randomCount: Int, _ interval: ClosedInterval<Element>) {
        self = Array(Element.randomSequence(interval, maxCount: randomCount))
    }

}