module Sprites where

import Licao
import Exercicio
import System.IO

getLetra:: Char -> String
getLetra 'a' = unlines [
    "▄▀▀▄",
    "█■■█",
    "█  █"
    ]
getLetra 'b' = unlines [
    "█▀▀▄",
    "█■■█",
    "█▄▄▀"
    ]
getLetra 'c' = unlines [
    "▄▀▀▄",
    "█   ",
    "▀▄▄▀"
    ]
getLetra 'd' = unlines [
    "█▀▀▄",
    "█  █",
    "█▄▄▀"
    ]
getLetra 'e' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "▀▄▄▄"
    ]
getLetra 'f' = unlines [
    "▄▀▀▀",
    "█■■ ",
    "█   "
    ]
getLetra 'g' = unlines [
    "▄▀▀ ",
    "█ ▀█",
    "▀▄▄▀"
    ]
getLetra 'h' = unlines [
    "█  █",
    "█■■█",
    "█  █"
    ]
getLetra 'i' = unlines [
    " ▐▌ ",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'j' = unlines [
    "   █",
    "   █",
    "▀▄▄▀"
    ]
getLetra 'k' = unlines [
    "█ ▄▀",
    "██  ",
    "█ ▀▄"
    ]
getLetra 'l' = unlines [
    "█   ",
    "█   ",
    "▀▄▄▄"
    ]
getLetra 'm' = unlines [
    "█▄▄█",
    "█▐▌█",
    "█  █"
    ]
getLetra 'n' = unlines [
    "█▄ █",
    "█ ▀█",
    "█  █"
    ]
getLetra 'o' = unlines [
    "▄▀▀▄",
    "█  █",
    "▀▄▄▀"
    ]
getLetra 'p' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█   "
    ]
getLetra 'q' = unlines [
    "▄▀▀▄",
    "█  █",
    " ▀▀▄"
    ]
getLetra 'r' = unlines [
    "█▀▀▄",
    "█▄▄▀",
    "█  █"
    ]
getLetra 's' = unlines [
    "▄▀▀▀",
    " ▀▀▄",
    "▄▄▄▀"
    ]
getLetra 't' = unlines [
    "▀▐▌▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'u' = unlines [
    "█  █",
    "█  █",
    "▀▄▄▀"
    ]
getLetra 'v' = unlines [
    "█  █",
    "▐▌▐▌",
    " ▐▌ "
    ]
getLetra 'w' = unlines [
    "█  █",
    "█▐▌█",
    "█▀▀█"
    ]
getLetra 'x' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    "▄▀▀▄"
    ]
getLetra 'y' = unlines [
    "▀▄▄▀",
    " ▐▌ ",
    " ▐▌ "
    ]
getLetra 'z' = unlines [
    "▀▀▀█",
    " ▄▀ ",
    "█▄▄▄"
    ]

getLetra ' ' = unlines [
    "    ",
    "    ",
    "████"
    ]

getCor :: String -> String
getCor "red" = "\ESC[31m"
getCor "green" = "\ESC[32m"
getCor "default" = "\ESC[0m"

aplicaCorPixels :: String -> String -> String
aplicaCorPixels cor content = getCor cor ++ content ++ getCor "default"

aplicaCor :: [Char] -> String -> String
aplicaCor [] cor = ""
aplicaCor (head : tail) cor = aplicaCorPixels cor [head] ++ aplicaCor tail cor

concatLinha :: [[String]] -> Int -> String -> String
concatLinha (h: []) lineNumber spacer = h !! lineNumber
concatLinha (h: t) lineNumber spacer = h !! lineNumber ++ spacer ++ concatLinha t lineNumber spacer

concatLinhas:: [[String]] -> Int -> String -> [String]
concatLinhas sprites lineNumber spacer
  | lineNumber < length (sprites !! 0) = [concatLinha sprites lineNumber spacer] ++ concatLinhas sprites (lineNumber + 1) spacer
  | otherwise = []

formataLinhasTexto :: [(Char, String)] -> String -> [String]
formataLinhasTexto [] spacer = []
formataLinhasTexto dataList spacer =
    let (head, tail) = splitAt 8 dataList
        sprites = map (\(char, cor) -> aplicaCor (getLetra char) cor) head
    in (concatLinhas (map (\sprite -> lines sprite) sprites) 0 spacer) ++ formataLinhasTexto tail spacer


------------------------------------------- Lições -------------------------------------------

exFlag :: Exercicio
exFlag = Exercicio "-1" "-1" [] ""

ex1 :: Char -> String -> [(String, String, String)] -> Exercicio
ex1 char idLicao dados = Exercicio "1" idLicao [(char, "default"), (char, "default"), (char, "default"), (char, "default"),
    (char, "default"), (char, "default"), (char, "default"), (char, "default")] (getStatusExercicios "1" idLicao dados)

ex2 :: (Char, Char) -> String -> [(String, String, String)] -> Exercicio
ex2 (char1, char2) idLicao dados = Exercicio "2" idLicao [(char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char1, "default"), (char1, "default"), (char2, "default")] (getStatusExercicios "2" idLicao dados)

ex3 :: (Char, Char) -> String -> [(String, String, String)] -> Exercicio
ex3 (char1, char2) idLicao dados = Exercicio "3" idLicao [(char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default"),
    (char1, "default"), (char2, "default"), (char1, "default"), (char2, "default")] (getStatusExercicios "3" idLicao dados)

ex4 :: (Char, Char, Char) -> String -> [(String, String, String)] -> Exercicio
ex4 (char1, char2, char3) idLicao dados = Exercicio "4" idLicao [(char1, "default"), (char1, "default"), (char3, "default"), (char2, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default"),
    (char2, "default"), (char1, "default"), (char1, "default"), (char3, "default")] (getStatusExercicios "4" idLicao dados)

licao1 :: [(String, String)] -> [(String, String, String)] -> Licao
licao1 dadosLicao dadosExercicios = 
    Licao "instrucao" [ex1 'j' "1" dadosExercicios, ex2 ('f', 'j') "1" dadosExercicios, ex3 (' ', 'j') "1" dadosExercicios, ex4 ('j', 'f', ' ') "1" dadosExercicios]
    (getStatusLicoes "1" dadosLicao)

licoes :: [(String, String)] -> [(String, String, String)] -> [Licao]
licoes dadosLicao dadosExercicios = [licao1 dadosLicao dadosExercicios]


