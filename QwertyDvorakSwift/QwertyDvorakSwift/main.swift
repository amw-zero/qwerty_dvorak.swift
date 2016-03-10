//
//  main.swift
//  QwertyDvorakSwift
//
//  Created by Alex Weisberger on 3/8/16.
//  Copyright © 2016 AMW. All rights reserved.
//

import Foundation

func to_dvorak(word: NSString, conversion_map: Dictionary<Character, Character>) -> String {
    var s = String()
    for c in ((word.lowercaseString as? String)?.characters)! {
        guard let converted_char = conversion_map[c] else {
            continue
        }
        s.append(converted_char)
    }
    
    return s
}

extension String {
    func contains_letters(letters: String) -> Bool {
        var has_any_letter = false
        for c in letters.characters {
            has_any_letter = has_any_letter || containsString(String(c))
        }
        
        return has_any_letter
    }
}

func convert_and_check(full_dict: NSString, conversion_map: Dictionary<Character, Character>) {
    var index: Dictionary<String, Bool> = Dictionary()
    
    let full_dict_lines = full_dict.componentsSeparatedByString("\n")
    for line in full_dict_lines {
        index[line] = true
    }
    for line in full_dict_lines {
        if line.contains_letters("EeQqWwZz") {
            //print("\(line) has a bad letter")
            continue
        }
        
        let converted = to_dvorak(line, conversion_map: conversion_map)
        if let _ = index[converted] {
            print("\(line)   |   \(converted)")
        }
    }
}

let file = "/usr/share/dict/words"
do {
    let full_dict = try NSString(contentsOfFile: file, encoding: NSUTF8StringEncoding)
    let q_to_d: Dictionary<Character, Character> = [
        "a" : "a",
        "b" : "x",
        "c" : "j",
        "d" : "e",
        "f" : "u",
        "g" : "i",
        "h" : "d",
        "i" : "c",
        "j" : "h",
        "k" : "t",
        "l" : "n",
        "m" : "m",
        "n" : "b",
        "o" : "r",
        "p" : "l",
        "r" : "p",
        "s" : "o",
        "t" : "y",
        "u" : "g",
        "v" : "k",
        "x" : "q",
        "y" : "f"
    ]
    convert_and_check(full_dict, conversion_map: q_to_d)
}
catch {
    print("No such file")
}


