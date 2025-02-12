//
//  InterfaceVariables.swift.swift
//
//  Variables associated with Scribe's user interface.
//

import UIKit

// A proxy into which text is typed.
var proxy: UITextDocumentProxy!
var controllerLanguage = String()
var controllerLanguageAbbr = String()
var spaceBar = String()

// Variables for keyboard appearance.
var keyboardHeight: CGFloat!
var keyCornerRadius: CGFloat!
var commandKeyCornerRadius: CGFloat!
var buttonWidth = CGFloat(0)
var letterButtonWidth = CGFloat(0)
var numSymButtonWidth = CGFloat(0)

// Arrays for the possible keyboard views that are loaded with their characters.
var letterKeys = [[String]]()
var numberKeys = [[String]]()
var symbolKeys = [[String]]()

// View that stores hold-to-select key options and the corresponding key arrays.
var alternatesKeyView: UIView!
var keysWithAlternates = [String]()
// The main currency symbol that will receive the alternates view for iPhones.
var currencySymbol: String = ""
var currencySymbolAlternates = [String]()
let dollarAlternateKeys = ["₿", "¢", "₽", "₩", "¥", "£", "€"]
let euroAlternateKeys = ["₿", "¢", "₽", "₩", "¥", "£", "$"]
let roubleAlternateKeys = ["₿", "¢", "₩", "¥", "£", "$", "€"]
let kronaAlternateKeys = ["₿", "¢", "₽", "¥", "£", "$", "€"]
// Symbol keys that have consistent alternates for iPhones.
var symbolKeysWithAlternatesLeft = ["/", "?", "!", "%", "&"]
let backslashAlternateKeys = ["\\"]
let questionMarkAlternateKeys = ["¿"]
let exclamationAlternateKeys = ["¡"]
let percentAlternateKeys = ["‰"]
let ampersandAlternateKeys = ["§"]
var symbolKeysWithAlternatesRight = ["'", "\"", "="]
let apostropheAlternateKeys = ["`", "´", "'"]
let quotationAlternateKeys = ["«", "»", "„", "“", "\""]
let equalSignAlternateKeys = ["≈", "±", "≠"]
var keysWithAlternatesLeft = [String]()
var keysWithAlternatesRight = [String]()
var keyAlternatesDict = [String: [String]]()
var aAlternateKeys = [String]()
var eAlternateKeys = [String]()
var еAlternateKeys = [String]() // Russian е
var iAlternateKeys = [String]()
var oAlternateKeys = [String]()
var uAlternateKeys = [String]()
var yAlternateKeys = [String]()
var äAlternateKeys = [String]()
var öAlternateKeys = [String]()
var sAlternateKeys = [String]()
var lAlternateKeys = [String]()
var zAlternateKeys = [String]()
var dAlternateKeys = [String]()
var cAlternateKeys = [String]()
var nAlternateKeys = [String]()
var ьAlternateKeys = [String]()

/// States of the keyboard corresponding to layouts found in KeyboardConstants.swift.
enum KeyboardState {
  case letters
  case numbers
  case symbols
}

/// What the keyboard state is in regards to the shift key.
/// - normal: not capitalized
/// - shift: capitalized
/// - caps: caps-lock
enum ShiftButtonState {
  case normal
  case shift
  case caps
}

// Baseline state variables.
var keyboardState: KeyboardState = .letters
var shiftButtonState: ShiftButtonState = .normal
var scribeBtnState: Bool = false

// Variables and functions to determine display parameters.
struct DeviceType {
  static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
  static let isPad = UIDevice.current.userInterfaceIdiom == .pad
}

var isLandscapeView: Bool = false

/// Checks if the device is in landscape mode.
func checkLandscapeMode() {
  if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
    isLandscapeView = true
  } else {
    isLandscapeView = false
  }
}

// Gets the abbreviation of the controller language to set translation displays.
func getControllerLanguageAbbr() -> String {
  if controllerLanguage == "French" {
    return "fr"
  } else if controllerLanguage == "German" {
    return "de"
  } else if controllerLanguage == "Portuguese" {
    return "pt"
  } else if controllerLanguage == "Russian" {
    return "ru"
  } else if controllerLanguage == "Spanish" {
    return "es"
  } else if controllerLanguage == "Swedish" {
    return "sv"
  } else {
    return ""
  }
}

// MARK: English interface variables

public enum EnglishKeyboardConstants {
  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "return"],
    ["shift", "w", "x", "c", "v", "b", "n", "m", ",", ".", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["@", "#", "$", "&", "*", "(", ")", "'", "\"", "return"],
    ["#+=", "%", "_", "+", "=", "/", ";", ":", ",", ".", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["€", "£", "¥", "_", "^", "[", "]", "{", "}", "return"],
    ["123", "§", "|", "~", "...", "\\", "<", ">", "!", "?", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "y", "s", "l", "z", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "y", "s", "z", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "l", "n"]

  static let aAlternateKeys = ["à", "á", "â", "ä", "æ", "ã", "å", "ā"]
  static let eAlternateKeys = ["è", "é", "ê", "ë", "ē", "ė", "ę"]
  static let iAlternateKeys = ["ì", "į", "ī", "í", "ï", "î"]
  static let oAlternateKeys = ["õ", "ō", "ø", "œ", "ó", "ò", "ö", "ô"]
  static let uAlternateKeys = ["ū", "ú", "ù", "ü", "û"]
  static let sAlternateKeys = ["ś", "š"]
  static let lAlternateKeys = ["ł"]
  static let zAlternateKeys = ["ž", "ź", "ż"]
  static let cAlternateKeys = ["ç", "ć", "č"]
  static let nAlternateKeys = ["ń", "ñ"]
}

/// Provides an English keyboard layout.
func setENKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = EnglishKeyboardConstants.letterKeysPhone
    numberKeys = EnglishKeyboardConstants.numberKeysPhone
    symbolKeys = EnglishKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = EnglishKeyboardConstants.letterKeysPad
    numberKeys = EnglishKeyboardConstants.numberKeysPad
    symbolKeys = EnglishKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = EnglishKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = EnglishKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = EnglishKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = EnglishKeyboardConstants.aAlternateKeys
  eAlternateKeys = EnglishKeyboardConstants.eAlternateKeys
  iAlternateKeys = EnglishKeyboardConstants.iAlternateKeys
  oAlternateKeys = EnglishKeyboardConstants.oAlternateKeys
  uAlternateKeys = EnglishKeyboardConstants.uAlternateKeys
  sAlternateKeys = EnglishKeyboardConstants.sAlternateKeys
  lAlternateKeys = EnglishKeyboardConstants.lAlternateKeys
  zAlternateKeys = EnglishKeyboardConstants.zAlternateKeys
  cAlternateKeys = EnglishKeyboardConstants.cAlternateKeys
  nAlternateKeys = EnglishKeyboardConstants.nAlternateKeys
  currencySymbol = "$"
  currencySymbolAlternates = dollarAlternateKeys
  spaceBar = "space"
  invalidCommandMsg = "Not in directory"

  translateBtnLbl = "Translate"
  translatePrompt = previewPromptSpacing + "en -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Conjugate"
  conjugatePrompt = previewPromptSpacing + "Conjugate: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Plural"
  pluralPrompt = previewPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: French interface variables

public enum FrenchKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["a", "z", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["q", "s", "d", "f", "g", "h", "j", "k", "l", "m"],
    ["shift", "w", "x", "c", "v", "b", "n", "'", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "€", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "$", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["a", "z", "e", "r", "t", "y", "u", "i", "o", "p", "delete"],
    ["q", "s", "d", "f", "g", "h", "j", "k", "l", "m", "return"],
    ["shift", "w", "x", "c", "v", "b", "n", "'", ",", ".", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["@", "#", "&", "\"", "€", "(", "!", ")", "-", "*", "return"],
    ["#+=", "%", "_", "+", "=", "/", ";", ":", ",", ".", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["~", "ᵒ", "[", "]", "{", "}", "^", "$", "£", "¥", "return"],
    ["123", "§", "<", ">", "|", "\\", "...", "·", "?", "'", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "y", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "y", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "n"]

  static let aAlternateKeys = ["à", "â", "æ", "á", "ä", "ã", "å", "ā", "ᵃ"]
  static let eAlternateKeys = ["é", "è", "ê", "ë", "ę", "ė", "ē"]
  static let iAlternateKeys = ["ī", "į", "í", "ì", "ï", "î"]
  static let oAlternateKeys = ["ᵒ", "ō", "ø", "õ", "ó", "ò", "ö", "œ", "ô"]
  static let uAlternateKeys = ["ū", "ú", "ü", "ù", "û"]
  static let yAlternateKeys = ["ÿ"]
  static let cAlternateKeys = ["ç", "ć", "č"]
  static let nAlternateKeys = ["ń", "ñ"]
}

/// Provides a French keyboard layout.
func setFRKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = FrenchKeyboardConstants.letterKeysPhone
    numberKeys = FrenchKeyboardConstants.numberKeysPhone
    symbolKeys = FrenchKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = FrenchKeyboardConstants.letterKeysPad
    numberKeys = FrenchKeyboardConstants.numberKeysPad
    symbolKeys = FrenchKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = FrenchKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = FrenchKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = FrenchKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = FrenchKeyboardConstants.aAlternateKeys
  eAlternateKeys = FrenchKeyboardConstants.eAlternateKeys
  iAlternateKeys = FrenchKeyboardConstants.iAlternateKeys
  oAlternateKeys = FrenchKeyboardConstants.oAlternateKeys
  uAlternateKeys = FrenchKeyboardConstants.uAlternateKeys
  yAlternateKeys = FrenchKeyboardConstants.yAlternateKeys
  cAlternateKeys = FrenchKeyboardConstants.cAlternateKeys
  nAlternateKeys = FrenchKeyboardConstants.nAlternateKeys
  currencySymbol = "€"
  currencySymbolAlternates = euroAlternateKeys
  spaceBar = "espace"
  invalidCommandMsg = "Pas dans le répertoire"

  translateBtnLbl = "Traduire"
  translatePrompt = previewPromptSpacing + "fr -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Conjuguer"
  conjugatePrompt = previewPromptSpacing + "Conjuguer: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Pluriel"
  pluralPrompt = previewPromptSpacing + "Pluriel: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: German interface variables

public enum GermanKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "ü"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ö", "ä"],
    ["shift", "y", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "€", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "$", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "ü", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ö", "ä", "return"],
    ["shift", "y", "x", "c", "v", "b", "n", "m", ",", ".", "ß", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+", "delete"],
    ["\"", "§", "€", "%", "&", "/", "(", ")", "=", "'", "#", "return"],
    ["#+=", "—", "`", "'", "...", "@", ";", ":", ",", ".", "-", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "*", "delete"],
    ["$", "£", "¥", "¿", "―", "\\", "[", "]", "{", "}", "|", "return"],
    ["123", "¡", "<", ">", "≠", "·", "^", "~", "!", "?", "_", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "y", "s", "l", "z", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "y", "s", "z", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "l", "n"]

  static let aAlternateKeys = ["à", "á", "â", "æ", "ã", "å", "ā", "ą"]
  static let eAlternateKeys = ["é", "è", "ê", "ë", "ė", "ę"]
  static let iAlternateKeys = ["ì", "ī", "í", "î", "ï"]
  static let oAlternateKeys = ["ō", "ø", "œ", "õ", "ó", "ò", "ô"]
  static let uAlternateKeys = ["ū", "ú", "ù", "û"]
  static let yAlternateKeys = ["ÿ"]
  static let sAlternateKeys = ["ß", "ś", "š"]
  static let lAlternateKeys = ["ł"]
  static let zAlternateKeys = ["ź", "ż"]
  static let cAlternateKeys = ["ç", "ć", "č"]
  static let nAlternateKeys = ["ń", "ñ"]
}

/// Provides a German keyboard layout.
func setDEKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = GermanKeyboardConstants.letterKeysPhone
    numberKeys = GermanKeyboardConstants.numberKeysPhone
    symbolKeys = GermanKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = GermanKeyboardConstants.letterKeysPad
    numberKeys = GermanKeyboardConstants.numberKeysPad
    symbolKeys = GermanKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = GermanKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = GermanKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = GermanKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = GermanKeyboardConstants.aAlternateKeys
  eAlternateKeys = GermanKeyboardConstants.eAlternateKeys
  iAlternateKeys = GermanKeyboardConstants.iAlternateKeys
  oAlternateKeys = GermanKeyboardConstants.oAlternateKeys
  uAlternateKeys = GermanKeyboardConstants.uAlternateKeys
  yAlternateKeys = GermanKeyboardConstants.yAlternateKeys
  sAlternateKeys = GermanKeyboardConstants.sAlternateKeys
  lAlternateKeys = GermanKeyboardConstants.lAlternateKeys
  zAlternateKeys = GermanKeyboardConstants.zAlternateKeys
  cAlternateKeys = GermanKeyboardConstants.cAlternateKeys
  nAlternateKeys = GermanKeyboardConstants.nAlternateKeys
  currencySymbol = "€"
  currencySymbolAlternates = euroAlternateKeys
  spaceBar = "Leerzeichen"
  invalidCommandMsg = "Nicht im Verzeichnis"

  translateBtnLbl = "Übersetzen"
  translatePrompt = previewPromptSpacing + "de -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Konjugieren"
  conjugatePrompt = previewPromptSpacing + "Konjugieren: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Plural"
  pluralPrompt = previewPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: Portuguese interface variables

public enum PortugueseKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "€", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "$", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "return"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "!", "?", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["@", "#", "$", "&", "*", "(", ")", "'", "\"", "return"],
    ["#+=", "%", "-", "+", "=", "/", ";", ":", ",", ".", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["€", "£", "¥", "_", "^", "[", "]", "{", "}", "return"],
    ["123", "§", "|", "~", "...", "\\", "<", ">", "!", "?", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "n"]

  static let aAlternateKeys = ["á", "ã", "à", "â", "ä", "å", "æ", "ᵃ"]
  static let eAlternateKeys = ["é", "ê", "è", "ę", "ė", "ē", "ë"]
  static let iAlternateKeys = ["ī", "į", "ï", "ì", "î", "í"]
  static let oAlternateKeys = ["ᵒ", "ō", "ø", "œ", "ö", "ò", "ô", "õ", "ó"]
  static let uAlternateKeys = ["ū", "û", "ù", "ü", "ú"]
  static let cAlternateKeys = ["ç"]
  static let nAlternateKeys = ["ñ"]
}

/// Provides a Portuguese keyboard layout.
func setPTKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = PortugueseKeyboardConstants.letterKeysPhone
    numberKeys = PortugueseKeyboardConstants.numberKeysPhone
    symbolKeys = PortugueseKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = PortugueseKeyboardConstants.letterKeysPad
    numberKeys = PortugueseKeyboardConstants.numberKeysPad
    symbolKeys = PortugueseKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = PortugueseKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = PortugueseKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = PortugueseKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = PortugueseKeyboardConstants.aAlternateKeys
  eAlternateKeys = PortugueseKeyboardConstants.eAlternateKeys
  iAlternateKeys = PortugueseKeyboardConstants.iAlternateKeys
  oAlternateKeys = PortugueseKeyboardConstants.oAlternateKeys
  uAlternateKeys = PortugueseKeyboardConstants.uAlternateKeys
  cAlternateKeys = PortugueseKeyboardConstants.cAlternateKeys
  nAlternateKeys = PortugueseKeyboardConstants.nAlternateKeys
  currencySymbol = "$"
  currencySymbolAlternates = dollarAlternateKeys
  spaceBar = "espaço"
  invalidCommandMsg = "Não está no diretório"

  translateBtnLbl = "Traduzir"
  translatePrompt = previewPromptSpacing + "pt -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Conjugar"
  conjugatePrompt = previewPromptSpacing + "Conjugar: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Plural"
  pluralPrompt = previewPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: Russian interface variables

public enum RussianKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х"],
    ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"],
    ["shift", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "₽", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["АБВ", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "$", "€", "£", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["АБВ", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "delete"],
    ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э", "return"],
    ["shift", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю", ".", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "—", "delete"],
    ["@", "#", "№", "₽", "ʼ", "&", "*", "(", ")", "'", "\"", "return"],
    ["#+=", "%", "_", "-", "+", "=", "≠", ";", ":", ",", ".", "#+="],
    ["АБВ", "selectKeyboard", "space", "АБВ", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "—", "delete"],
    ["$", "€", "£", "¥", "±", "·", "`", "[", "]", "{", "}", "return"],
    ["123", "§", "|", "~", "...", "^", "\\", "<", ">", "!", "?", "123"],
    ["АБВ", "selectKeyboard", "space", "АБВ", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["е", "ь"]
  static let keysWithAlternatesLeft = ["е"]
  static let keysWithAlternatesRight = ["ь"]

  static let еAlternateKeys = ["ë"]
  static let ьAlternateKeys = ["Ъ"]
}

/// Provides a Russian keyboard layout.
func setRUKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = RussianKeyboardConstants.letterKeysPhone
    numberKeys = RussianKeyboardConstants.numberKeysPhone
    symbolKeys = RussianKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = RussianKeyboardConstants.letterKeysPad
    numberKeys = RussianKeyboardConstants.numberKeysPad
    symbolKeys = RussianKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = RussianKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = RussianKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = RussianKeyboardConstants.keysWithAlternatesRight
  еAlternateKeys = RussianKeyboardConstants.еAlternateKeys
  ьAlternateKeys = RussianKeyboardConstants.ьAlternateKeys
  currencySymbol = "₽"
  currencySymbolAlternates = roubleAlternateKeys
  spaceBar = "Пробел"
  invalidCommandMsg = "Нет в каталоге"

  translateBtnLbl = "Перевести"
  translatePrompt = previewPromptSpacing + "ru -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Спрягать"
  conjugatePrompt = previewPromptSpacing + "Спрягать: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Множ"
  pluralPrompt = previewPromptSpacing + "Множ: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: Spanish interface variables

public class SpanishKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ"],
    ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ñ", "return"],
    ["shift", "y", "x", "c", "v", "b", "n", "m", ",", ".", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["@", "#", "$", "&", "*", "(", ")", "'", "\"", "+", "return"],
    ["#+=", "%", "_", "-", "=", "/", ";", ":", ",", ".", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "delete"],
    ["€", "£", "¥", "^", "[", "]", "{", "}", "ᵒ", "ᵃ", "return"],
    ["123", "§", "|", "~", "¶", "\\", "<", ">", "¡", "¿", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "s", "d", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "s", "d", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "n"]

  static let aAlternateKeys = ["á", "à", "ä", "â", "ã", "å", "ą", "æ", "ā", "ᵃ"]
  static let eAlternateKeys = ["é", "è", "ë", "ê", "ę", "ė", "ē"]
  static let iAlternateKeys = ["ī", "į", "î", "ì", "ï", "í"]
  static let oAlternateKeys = ["ᵒ", "ō", "œ", "ø", "õ", "ô", "ö", "ó", "ò"]
  static let uAlternateKeys = ["ū", "û", "ù", "ü", "ú"]
  static let sAlternateKeys = ["š"]
  static let dAlternateKeys = ["đ"]
  static let cAlternateKeys = ["ç", "ć", "č"]
  static let nAlternateKeys = ["ń"]
}

/// Provides a Spanish keyboard layout.
func setESKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = SpanishKeyboardConstants.letterKeysPhone
    numberKeys = SpanishKeyboardConstants.numberKeysPhone
    symbolKeys = SpanishKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = SpanishKeyboardConstants.letterKeysPad
    numberKeys = SpanishKeyboardConstants.numberKeysPad
    symbolKeys = SpanishKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = SpanishKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = SpanishKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = SpanishKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = SpanishKeyboardConstants.aAlternateKeys
  eAlternateKeys = SpanishKeyboardConstants.eAlternateKeys
  iAlternateKeys = SpanishKeyboardConstants.iAlternateKeys
  oAlternateKeys = SpanishKeyboardConstants.oAlternateKeys
  uAlternateKeys = SpanishKeyboardConstants.uAlternateKeys
  sAlternateKeys = SpanishKeyboardConstants.sAlternateKeys
  dAlternateKeys = SpanishKeyboardConstants.dAlternateKeys
  cAlternateKeys = SpanishKeyboardConstants.cAlternateKeys
  nAlternateKeys = SpanishKeyboardConstants.nAlternateKeys
  currencySymbol = "$"
  currencySymbolAlternates = dollarAlternateKeys
  spaceBar = "espacio"
  invalidCommandMsg = "No en el directorio"

  translateBtnLbl = "Traducir"
  translatePrompt = previewPromptSpacing + "es -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Conjugar"
  conjugatePrompt = previewPromptSpacing + "Conjugar: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Plural"
  pluralPrompt = previewPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}

// MARK: Swedish interface variables

public class SwedishKeyboardConstants {

  // Keyboard key layouts.
  static let letterKeysPhone = [
    ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "å"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ö", "ä"],
    ["shift", "y", "x", "c", "v", "b", "n", "m", "delete"],
    ["123", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let numberKeysPhone = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
    ["-", "/", ":", ";", "(", ")", "kr", "&", "@", "\""],
    ["#+=", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let symbolKeysPhone = [
    ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
    ["_", "\\", "|", "~", "<", ">", "€", "$", "£", "·"],
    ["123", ".", ",", "?", "!", "'", "delete"],
    ["ABC", "selectKeyboard", "space", "return"] // "undoArrow"
  ]

  static let letterKeysPad = [
    ["q", "w", "e", "r", "t", "z", "u", "i", "o", "p", "å", "delete"],
    ["a", "s", "d", "f", "g", "h", "j", "k", "l", "ö", "ä", "return"],
    ["shift", "y", "x", "c", "v", "b", "n", "m", ",", ".", "-", "shift"],
    [".?123", "selectKeyboard", "space", ".?123", "hideKeyboard"] // "undoArrow"
  ]

  static let numberKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "`", "delete"],
    ["@", "#", "kr", "&", "*", "(", ")", "'", "\"", "+", "·", "return"],
    ["#+=", "%", "≈", "±", "=", "/", ";", ":", ",", ".", "-", "#+="],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  static let symbolKeysPad = [
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "*", "delete"],
    ["€", "$", "£", "^", "[", "]", "{", "}", "―", "ᵒ", "...", "return"],
    ["123", "§", "|", "~", "≠", "\\", "<", ">", "!", "?", "_", "123"],
    ["ABC", "selectKeyboard", "space", "ABC", "hideKeyboard"] // "undoArrow"
  ]

  // Alternate key vars.
  static let keysWithAlternates = ["a", "e", "i", "o", "u", "ä", "ö", "s", "c", "n"]
  static let keysWithAlternatesLeft = ["a", "e", "s", "c"]
  static let keysWithAlternatesRight = ["i", "o", "u", "ä", "ö", "n"]

  static let aAlternateKeys = ["á", "à", "â", "ã", "ā"]
  static let eAlternateKeys = ["é", "ë", "è", "ê", "ẽ", "ē", "ę"]
  static let iAlternateKeys = ["ī", "î", "í", "ï", "ì", "ĩ"]
  static let oAlternateKeys = ["ō", "õ", "ô", "ò", "ó", "œ"]
  static let uAlternateKeys = ["û", "ú", "ü", "ù", "ũ", "ū"]
  static let äAlternateKeys = ["æ"]
  static let öAlternateKeys = ["ø"]
  static let sAlternateKeys = ["ß", "ś", "š"]
  static let cAlternateKeys = ["ç"]
  static let nAlternateKeys = ["ñ"]
}

/// Provides a Swedish keyboard layout.
func setSVKeyboardLayout() {
  if DeviceType.isPhone {
    letterKeys = SwedishKeyboardConstants.letterKeysPhone
    numberKeys = SwedishKeyboardConstants.numberKeysPhone
    symbolKeys = SwedishKeyboardConstants.symbolKeysPhone
  } else {
    letterKeys = SwedishKeyboardConstants.letterKeysPad
    numberKeys = SwedishKeyboardConstants.numberKeysPad
    symbolKeys = SwedishKeyboardConstants.symbolKeysPad
  }

  keysWithAlternates = SwedishKeyboardConstants.keysWithAlternates
  keysWithAlternatesLeft = SwedishKeyboardConstants.keysWithAlternatesLeft
  keysWithAlternatesRight = SwedishKeyboardConstants.keysWithAlternatesRight
  aAlternateKeys = SwedishKeyboardConstants.aAlternateKeys
  eAlternateKeys = SwedishKeyboardConstants.eAlternateKeys
  iAlternateKeys = SwedishKeyboardConstants.iAlternateKeys
  oAlternateKeys = SwedishKeyboardConstants.oAlternateKeys
  uAlternateKeys = SwedishKeyboardConstants.uAlternateKeys
  äAlternateKeys = SwedishKeyboardConstants.äAlternateKeys
  öAlternateKeys = SwedishKeyboardConstants.öAlternateKeys
  sAlternateKeys = SwedishKeyboardConstants.sAlternateKeys
  cAlternateKeys = SwedishKeyboardConstants.cAlternateKeys
  nAlternateKeys = SwedishKeyboardConstants.nAlternateKeys
  currencySymbol = "kr"
  currencySymbolAlternates = kronaAlternateKeys
  spaceBar = "mellanslag"
  invalidCommandMsg = "Inte i katalogen"

  translateBtnLbl = "Översätt"
  translatePrompt = previewPromptSpacing + "sv -› \(getControllerLanguageAbbr()): "
  translatePromptAndCursor = translatePrompt + previewCursor

  conjugateBtnLbl = "Konjugera"
  conjugatePrompt = previewPromptSpacing + "Konjugera: "
  conjugatePromptAndCursor = conjugatePrompt + previewCursor

  pluralBtnLbl = "Plural"
  pluralPrompt = previewPromptSpacing + "Plural: "
  pluralPromptAndCursor = pluralPrompt + previewCursor
}
