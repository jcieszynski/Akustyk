<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Profanity Filter Configuration
    |--------------------------------------------------------------------------
    |
    |
    */

    /* Disable to replace partial words. */
    'replaceFullWords' => true,

    /* Replace bad words with this, based on length of word */
    'replaceWith' => '*',

    /* Replace related letters */
    'strReplace' => [
            'a' => '(a|a\.|a\-|4|@|Á|á|À|Â|à|Â|â|Ä|ä|Ã|ã|Å|å|α|Δ|Λ|λ)',
            'b' => '(b|b\.|b\-|8|\|3|ß|Β|β)',
            'c' => '(c|c\.|c\-|Ç|ç|¢|€|<|\(|{|©)',
            'd' => '(d|d\.|d\-|&part;|\|\)|Þ|þ|Ð|ð)',
            'e' => '(e|e\.|e\-|3|€|È|è|É|é|Ê|ê|∑)',
            'f' => '(f|f\.|f\-|ƒ)',
            'g' => '(g|g\.|g\-|6|9)',
            'h' => '(h|h\.|h\-|Η)',
            'i' => '(i|i\.|i\-|!|\||\]\[|]|1|∫|Ì|Í|Î|Ï|ì|í|î|ï)',
            'j' => '(j|j\.|j\-)',
            'k' => '(k|k\.|k\-|Κ|κ)',
            'l' => '(l|1\.|l\-|!|\||\]\[|]|£|∫|Ì|Í|Î|Ï)',
            'm' => '(m|m\.|m\-)',
            'n' => '(n|n\.|n\-|η|Ν|Π)',
            'o' => '(o|o\.|o\-|0|Ο|ο|Φ|¤|°|ø)',
            'p' => '(p|p\.|p\-|ρ|Ρ|¶|þ)',
            'q' => '(q|q\.|q\-)',
            'r' => '(r|r\.|r\-|®)',
            's' => '(s|s\.|s\-|5|\$|§)',
            't' => '(t|t\.|t\-|Τ|τ)',
            'u' => '(u|u\.|u\-|υ|µ)',
            'v' => '(v|v\.|v\-|υ|ν)',
            'w' => '(w|w\.|w\-|ω|ψ|Ψ)',
            'x' => '(x|x\.|x\-|Χ|χ)',
            'y' => '(y|y\.|y\-|¥|γ|ÿ|ý|Ÿ|Ý)',
            'z' => '(z|z\.|z\-|Ζ)',
    ],

    /* Replace these words no matter what language. */
    'defaults' => [
        'anal',
        'anus',
        'arse',
        'ass',
        'arsehole ',
        'ass-hat',
        'ass-jabber',
        'ass-pirate',
        'assbag',
        'assbandit ',
        'assbanger ',
        'assbite',
        'assclown',
        'asscock',
        'asscracker',
        'asses',
        'assface ',
        'assfuck',
        'assfucker',
        'assgoblin',
        'asshat',
        'asshead',
        'asshole',
        'asshopper',
        'assjacker',
        'asslick',
        'asslicker',
        'assmonkey',
        'assmunch',
        'assmuncher',
        'assnigger',
        'asspirate',
        'assshit',
        'assshole',
        'asssucker',
        'asswad',
        'asswipe',
        'axwound',
        'ballsack',
        'balls',
        'bastard',
        'bitch',
        'biatch',
        'bloody',
        'blowjob',
        'bollock',
        'bollok',
        'boner',
        'boob',
        'bugger',
        'bum',
        'butt',
        'buttplug',
        'clitoris',
        'cock',
        'coon',
        'crap',
        'cunt',
        'damn',
        'dick',
        'dildo',
        'dyke',
        'fag',
        'feck',
        'fellate',
        'fellatio',
        'felching',
        'fuck',
        'fudgepacker',
        'flange',
        'goddamn',
        'hell',
        'homo',
        'jizz',
        'knobend',
        'labia',
        'muff',
        'nigger',
        'nigga',
        'penis',
        'piss',
        'poop',
        'prick',
        'pube',
        'pussy',
        'queer',
        'scrotum',
        'sex',
        'shit',
        'sh1t',
        'slut',
        'smegma',
        'spunk',
        'suck',
        'tit',
        'tosser',
        'turd',
        'twat',
        'vagina',
        'wank',
        'whore',
        'wtf',
        'kurwa',
        'cipa',
        'chuj',
        'kutas',
        'certolić',
        'jebać',
        'jebak',
        'pierdolić',
        'ruchać',
        'rżnąć',
        'rżnąłbym',
        'ruchałbym',
        'wypierdalać',
        'wypierdol',
        'wypierdole',
        'dziwka',
        'frajer',
        'skurwiel',
        'skurwysyn',
        'suka',
        'zdzira',
        'gówno',
        'wkurwia',
        'wkurwiać',
        'szczać',
        'srać',
        'chuja',
        'samojebka',
        'najebać',
        'najebany',
        'dopierdalać',
        'dopierdolony',
        'skurwesyn',
        'dojebać',
        'dojebany',
        'zajebisty',
        'zajebiście',
        'zajebistość',
        'kurwiszon',
        'dziwkarz',
        'jebany',
        'cwel',
        'kurwo',
        'jebana',
        'pierdol',
        'jebane',
        'jebaniutki',
        'pizda',
        'piździutki',
        'pizdu',
        'zajebany'

    ],
];
