#!/usr/bin/env hy

(setv blackletter            (.split "𝔄 𝔅 ℭ 𝔇 𝔈 𝔉 𝔊 ℌ ℑ 𝔍 𝔎 𝔏 𝔐 𝔑 𝔒 𝔓 𝔔 ℜ 𝔖 𝔗 𝔘 𝔙 𝔚 𝔛 𝔜 ℨ 𝔞 𝔟 𝔠 𝔡 𝔢 𝔣 𝔤 𝔥 𝔦 𝔧 𝔨 𝔩 𝔪 𝔫 𝔬 𝔭 𝔮 𝔯 𝔰 𝔱 𝔲 𝔳 𝔴 𝔵 𝔶 𝔷"))
(setv blackletter_bold       (.split "𝕬 𝕭 𝕮 𝕯 𝕰 𝕱 𝕲 𝕳 𝕴 𝕵 𝕶 𝕷 𝕸 𝕹 𝕺 𝕻 𝕼 𝕽 𝕾 𝕿 𝖀 𝖁 𝖂 𝖃 𝖄 𝖅 𝖆 𝖇 𝖈 𝖉 𝖊 𝖋 𝖌 𝖍 𝖎 𝖏 𝖐 𝖑 𝖒 𝖓 𝖔 𝖕 𝖖 𝖗 𝖘 𝖙 𝖚 𝖛 𝖜 𝖝 𝖞 𝖟"))
(setv serif_bold             (.split "𝐀 𝐁 𝐂 𝐃 𝐄 𝐅 𝐆 𝐇 𝐈 𝐉 𝐊 𝐋 𝐌 𝐍 𝐎 𝐏 𝐐 𝐑 𝐒 𝐓 𝐔 𝐕 𝐖 𝐗 𝐘 𝐙 𝐚 𝐛 𝐜 𝐝 𝐞 𝐟 𝐠 𝐡 𝐢 𝐣 𝐤 𝐥 𝐦 𝐧 𝐨 𝐩 𝐪 𝐫 𝐬 𝐭 𝐮 𝐯 𝐰 𝐱 𝐲 𝐳"))
(setv serif_italic           (.split "𝐴 𝐵 𝐶 𝐷 𝐸 𝐹 𝐺 𝐻 𝐼 𝐽 𝐾 𝐿 𝑀 𝑁 𝑂 𝑃 𝑄 𝑅 𝑆 𝑇 𝑈 𝑉 𝑊 𝑋 𝑌 𝑍 𝑎 𝑏 𝑐 𝑑 𝑒 𝑓 𝑔 ℎ 𝑖 𝑗 𝑘 𝑙 𝑚 𝑛 𝑜 𝑝 𝑞 𝑟 𝑠 𝑡 𝑢 𝑣 𝑤 𝑥 𝑦 𝑧"))
(setv serif_bold_italic      (.split "𝑨 𝑩 𝑪 𝑫 𝑬 𝑭 𝑮 𝑯 𝑰 𝑱 𝑲 𝑳 𝑴 𝑵 𝑶 𝑷 𝑸 𝑹 𝑺 𝑻 𝑼 𝑽 𝑾 𝑿 𝒀 𝒁 𝒂 𝒃 𝒄 𝒅 𝒆 𝒇 𝒈 𝒉 𝒊 𝒋 𝒌 𝒍 𝒎 𝒏 𝒐 𝒑 𝒒 𝒓 𝒔 𝒕 𝒖 𝒗 𝒘 𝒙 𝒚 𝒛"))
(setv sanserif               (.split "𝖠 𝖡 𝖢 𝖣 𝖤 𝖥 𝖦 𝖧 𝖨 𝖩 𝖪 𝖫 𝖬 𝖭 𝖮 𝖯 𝖰 𝖱 𝖲 𝖳 𝖴 𝖵 𝖶 𝖷 𝖸 𝖹 𝖺 𝖻 𝖼 𝖽 𝖾 𝖿 𝗀 𝗁 𝗂 𝗃 𝗄 𝗅 𝗆 𝗇 𝗈 𝗉 𝗊 𝗋 𝗌 𝗍 𝗎 𝗏 𝗐 𝗑 𝗒 𝗓"))
(setv sanserif_bold          (.split "𝗔 𝗕 𝗖 𝗗 𝗘 𝗙 𝗚 𝗛 𝗜 𝗝 𝗞 𝗟 𝗠 𝗡 𝗢 𝗣 𝗤 𝗥 𝗦 𝗧 𝗨 𝗩 𝗪 𝗫 𝗬 𝗭 𝗮 𝗯 𝗰 𝗱 𝗲 𝗳 𝗴 𝗵 𝗶 𝗷 𝗸 𝗹 𝗺 𝗻 𝗼 𝗽 𝗾 𝗿 𝘀 𝘁 𝘂 𝘃 𝘄 𝘅 𝘆 𝘇"))
(setv sanserif_italic        (.split "𝘈 𝘉 𝘊 𝘋 𝘌 𝘍 𝘎 𝘏 𝘐 𝘑 𝘒 𝘓 𝘔 𝘕 𝘖 𝘗 𝘘 𝘙 𝘚 𝘛 𝘜 𝘝 𝘞 𝘟 𝘠 𝘡 𝘢 𝘣 𝘤 𝘥 𝘦 𝘧 𝘨 𝘩 𝘪 𝘫 𝘬 𝘭 𝘮 𝘯 𝘰 𝘱 𝘲 𝘳 𝘴 𝘵 𝘶 𝘷 𝘸 𝘹 𝘺 𝘻"))
(setv sanserif_bold_italic   (.split "𝘼 𝘽 𝘾 𝘿 𝙀 𝙁 𝙂 𝙃 𝙄 𝙅 𝙆 𝙇 𝙈 𝙉 𝙊 𝙋 𝙌 𝙍 𝙎 𝙏 𝙐 𝙑 𝙒 𝙓 𝙔 𝙕 𝙖 𝙗 𝙘 𝙙 𝙚 𝙛 𝙜 𝙝 𝙞 𝙟 𝙠 𝙡 𝙢 𝙣 𝙤 𝙥 𝙦 𝙧 𝙨 𝙩 𝙪 𝙫 𝙬 𝙭 𝙮 𝙯"))
(setv script                 (.split "𝒜 ℬ 𝒞 𝒟 ℰ ℱ 𝒢 ℋ ℐ 𝒥 𝒦 ℒ ℳ 𝒩 𝒪 𝒫 𝒬 ℛ 𝒮 𝒯 𝒰 𝒱 𝒲 𝒳 𝒴 𝒵 𝒶 𝒷 𝒸 𝒹 ℯ 𝒻 ℊ 𝒽 𝒾 𝒿 𝓀 𝓁 𝓂 𝓃 ℴ 𝓅 𝓆 𝓇 𝓈 𝓉 𝓊 𝓋 𝓌 𝓍 𝓎 𝓏"))
(setv script_bold            (.split "𝓐 𝓑 𝓒 𝓓 𝓔 𝓕 𝓖 𝓗 𝓘 𝓙 𝓚 𝓛 𝓜 𝓝 𝓞 𝓟 𝓠 𝓡 𝓢 𝓣 𝓤 𝓥 𝓦 𝓧 𝓨 𝓩 𝓪 𝓫 𝓬 𝓭 𝓮 𝓯 𝓰 𝓱 𝓲 𝓳 𝓴 𝓵 𝓶 𝓷 𝓸 𝓹 𝓺 𝓻 𝓼 𝓽 𝓾 𝓿 𝔀 𝔁 𝔂 𝔃"))
(setv monospace              (.split "𝙰 𝙱 𝙲 𝙳 𝙴 𝙵 𝙶 𝙷 𝙸 𝙹 𝙺 𝙻 𝙼 𝙽 𝙾 𝙿 𝚀 𝚁 𝚂 𝚃 𝚄 𝚅 𝚆 𝚇 𝚈 𝚉 𝚊 𝚋 𝚌 𝚍 𝚎 𝚏 𝚐 𝚑 𝚒 𝚓 𝚔 𝚕 𝚖 𝚗 𝚘 𝚙 𝚚 𝚛 𝚜 𝚝 𝚞 𝚟 𝚠 𝚡 𝚢 𝚣"))
(setv regional_square_spaced ["🄰 " "🄱 " "🄲 " "🄳 " "🄴 " "🄵 " "🄶 " "🄷 " "🄸 " "🄹 " "🄺 " "🄻 " "🄼 " "🄽 " "🄾 ""🄿 " "🅀 " "🅁 " "🅂 " "🅃 " "🅄 " "🅅 " "🅆 " "🅇 " "🅈 " "🅉 " "🄰 " "🄱 " "🄲 " "🄳 " "🄴 " "🄵 " "🄶 " "🄷 " "🄸 " "🄹 " "🄺 " "🄻 " "🄼 " "🄽 " "🄾 ""🄿 " "🅀 " "🅁 " "🅂 " "🅃 " "🅄 " "🅅 " "🅆 " "🅇 " "🅈 " "🅉 "])
(setv regional_square        ["🄰" "🄱" "🄲" "🄳" "🄴" "🄵" "🄶" "🄷" "🄸" "🄹" "🄺" "🄻" "🄼" "🄽" "🄾" "🄿" "🅀" "🅁" "🅂" "🅃" "🅄" "🅅" "🅆" "🅇" "🅈" "🅉" "🄰" "🄱" "🄲" "🄳" "🄴" "🄵" "🄶" "🄷" "🄸" "🄹" "🄺" "🄻" "🄼" "🄽" "🄾" "🄿" "🅀" "🅁" "🅂" "🅃" "🅄" "🅅" "🅆" "🅇" "🅈" "🅉"])
(setv regional_circle        ["🅐" "🅑" "🅒" "🅓" "🅔" "🅕" "🅖" "🅗" "🅘" "🅙" "🅚" "🅛" "🅜" "🅝" "🅞" "🅟" "🅠" "🅡" "🅢" "🅣" "🅤" "🅥" "🅦" "🅧" "🅨" "🅩" "🅐" "🅑" "🅒" "🅓" "🅔" "🅕" "🅖" "🅗" "🅘" "🅙" "🅚" "🅛" "🅜" "🅝" "🅞" "🅟" "🅠" "🅡" "🅢" "🅣" "🅤" "🅥" "🅦" "🅧" "🅨" "🅩"])
(setv regional_circle_spaced ["🅐 " "🅑 " "🅒 " "🅓 " "🅔 " "🅕 " "🅖 " "🅗 " "🅘 " "🅙 " "🅚 " "🅛 " "🅜 " "🅝 " "🅞 " "🅟 " "🅠 " "🅡 " "🅢 " "🅣 " "🅤 " "🅥 " "🅦 " "🅧 " "🅨 " "🅩 " "🅐 " "🅑 " "🅒 " "🅓 " "🅔 " "🅕 " "🅖 " "🅗 " "🅘 " "🅙 " "🅚 " "🅛 " "🅜 " "🅝 " "🅞 " "🅟 " "🅠 " "🅡 " "🅢 " "🅣 " "🅤 " "🅥 " "🅦 " "🅧 " "🅨 " "🅩 "])
(setv blackboard_bold        (.split "𝔸 𝔹 ℂ 𝔻 𝔼 𝔽 𝔾 ℍ 𝕀 𝕁 𝕂 𝕃 𝕄 ℕ 𝕆 ℙ ℚ ℝ 𝕊 𝕋 𝕌 𝕍 𝕎 𝕏 𝕐 ℤ 𝕒 𝕓 𝕔 𝕕 𝕖 𝕗 𝕘 𝕙 𝕚 𝕛 𝕜 𝕝 𝕞 𝕟 𝕠 𝕡 𝕢 𝕣 𝕤 𝕥 𝕦 𝕧 𝕨 𝕩 𝕪 𝕫"))
(setv normal                 (.split "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z"))

(setv sets {})
(assoc sets "blackletter" blackletter)
(assoc sets "blackletterbold" blackletter_bold)
(assoc sets "serifbold" serif_bold) 
(assoc sets "serifitalic" serif_italic)     
(assoc sets "serifbolditalic" serif_bold_italic)   
(assoc sets "sanserif" sanserif)    
(assoc sets "sanserifbold" sanserif_bold)        
(assoc sets "sanserifitalic" sanserif_italic)   
(assoc sets "sanserifbolditalic" sanserif_bold_italic) 
(assoc sets "script" script)
(assoc sets "scriptbold" script_bold)
(assoc sets "monospace" monospace)
(assoc sets "regionalsquare" regional_square)
(assoc sets "regionalsquarespaced" regional_square_spaced)
(assoc sets "regionalcircle" regional_circle)
(assoc sets "regionalcirclespaced" regional_circle_spaced)
(assoc sets "blackboardbold" blackboard_bold)

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