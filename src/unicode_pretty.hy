#!/usr/bin/env hy

(setv blackletter            (.split "𝔞 𝔟 𝔠 𝔡 𝔢 𝔣 𝔤 𝔥 𝔦 𝔧 𝔨 𝔩 𝔪 𝔫 𝔬 𝔭 𝔮 𝔯 𝔰 𝔱 𝔲 𝔳 𝔴 𝔵 𝔶 𝔷 𝔄 𝔅 ℭ 𝔇 𝔈 𝔉 𝔊 ℌ ℑ 𝔍 𝔎 𝔏 𝔐 𝔑 𝔒 𝔓 𝔔 ℜ 𝔖 𝔗 𝔘 𝔙 𝔚 𝔛 𝔜 ℨ"))
(setv blackletter_bold       (.split "𝖆 𝖇 𝖈 𝖉 𝖊 𝖋 𝖌 𝖍 𝖎 𝖏 𝖐 𝖑 𝖒 𝖓 𝖔 𝖕 𝖖 𝖗 𝖘 𝖙 𝖚 𝖛 𝖜 𝖝 𝖞 𝖟 𝕬 𝕭 𝕮 𝕯 𝕰 𝕱 𝕲 𝕳 𝕴 𝕵 𝕶 𝕷 𝕸 𝕹 𝕺 𝕻 𝕼 𝕽 𝕾 𝕿 𝖀 𝖁 𝖂 𝖃 𝖄 𝖅"))
(setv regional_square_spaced ["🄰 " "🄱 " "🄲 " "🄳 " "🄴 " "🄵 " "🄶 " "🄷 " "🄸 " "🄹 " "🄺 " "🄻 " "🄼 " "🄽 " "🄾 ""🄿 " "🅀 " "🅁 " "🅂 " "🅃 " "🅄 " "🅅 " "🅆 " "🅇 " "🅈 " "🅉 " "🄰 " "🄱 " "🄲 " "🄳 " "🄴 " "🄵 " "🄶 " "🄷 " "🄸 " "🄹 " "🄺 " "🄻 " "🄼 " "🄽 " "🄾 ""🄿 " "🅀 " "🅁 " "🅂 " "🅃 " "🅄 " "🅅 " "🅆 " "🅇 " "🅈 " "🅉 "])
(setv regional_square        ["🄰" "🄱" "🄲" "🄳" "🄴" "🄵" "🄶" "🄷" "🄸" "🄹" "🄺" "🄻" "🄼" "🄽" "🄾" "🄿" "🅀" "🅁" "🅂" "🅃" "🅄" "🅅" "🅆" "🅇" "🅈" "🅉" "🄰" "🄱" "🄲" "🄳" "🄴" "🄵" "🄶" "🄷" "🄸" "🄹" "🄺" "🄻" "🄼" "🄽" "🄾" "🄿" "🅀" "🅁" "🅂" "🅃" "🅄" "🅅" "🅆" "🅇" "🅈" "🅉"])
(setv regional_circle        ["🅐" "🅑" "🅒" "🅓" "🅔" "🅕" "🅖" "🅗" "🅘" "🅙" "🅚" "🅛" "🅜" "🅝" "🅞" "🅟" "🅠" "🅡" "🅢" "🅣" "🅤" "🅥" "🅦" "🅧" "🅨" "🅩" "🅐" "🅑" "🅒" "🅓" "🅔" "🅕" "🅖" "🅗" "🅘" "🅙" "🅚" "🅛" "🅜" "🅝" "🅞" "🅟" "🅠" "🅡" "🅢" "🅣" "🅤" "🅥" "🅦" "🅧" "🅨" "🅩"])
(setv regional_circle_spaced ["🅐 " "🅑 " "🅒 " "🅓 " "🅔 " "🅕 " "🅖 " "🅗 " "🅘 " "🅙 " "🅚 " "🅛 " "🅜 " "🅝 " "🅞 " "🅟 " "🅠 " "🅡 " "🅢 " "🅣 " "🅤 " "🅥 " "🅦 " "🅧 " "🅨 " "🅩 " "🅐 " "🅑 " "🅒 " "🅓 " "🅔 " "🅕 " "🅖 " "🅗 " "🅘 " "🅙 " "🅚 " "🅛 " "🅜 " "🅝 " "🅞 " "🅟 " "🅠 " "🅡 " "🅢 " "🅣 " "🅤 " "🅥 " "🅦 " "🅧 " "🅨 " "🅩 "])

(setv normal                 (.split "a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"))

(setv sets {})
(assoc sets "blackletter" blackletter)
(assoc sets "blackletterbold" blackletter_bold)
(assoc sets "regionalsquare" regional_square)
(assoc sets "regionalsquarespaced" regional_square_spaced)
(assoc sets "regionalcircle" regional_circle)
(assoc sets "regionalcirclespaced" regional_circle_spaced)

(defn debug [] 
    (for [a (list (enumerate normal_lower))]
        (setv orig (get a 1))
        (setv bl (get blackletter_lower (get a 0)))
        (setv bu (get blackletter_upper (get a 0)))
        (setv blb (get blackletter_lower_bold (get a 0)))
        (setv bub (get blackletter_upper_bold (get a 0)))
        (print (+ orig ": " bl " " bu " " blb " " bub))
    )
)

(defn convert [to_convert tc]
    (setv r "")
    (for [a (list to_convert)]
        (if (in a normal) (setv r (+ r (get tc (.index normal a))))
        (setv r (+ r a)))
    )
    r
)

(defn read_convert[tc]
    (import sys)
    (setv g "")
    (for [a (list sys.stdin)]
        (setv g (+ g a))
    )
    (print (convert g tc))
)

(defn print_sets[]
    (print "Available alphabets:\n")
    (for [a (sorted sets)]
        (print (+ "  "a))
    )
    (print "")
)

(defn main[]
    
    (import argparse)
    (import sys)

    (setv default_set "blackletter")
    
    (setv parser (argparse.ArgumentParser :description "Convert ASCII strings to special Unicode characters."))
    (.add_argument parser "-l" :action "store_true" :help "List available alphabets.")
    (.add_argument parser "-a" :metavar "alphabet" :type str :help "Set alphabet.")

    (setv args (parser.parse_args))

    (if args.a (if (in args.a sets) (setv default_set args.a) (sys.exit "No such alphabet.")))

    (if args.l (print_sets) 
               (read_convert (get sets default_set))
    )
)

(main)