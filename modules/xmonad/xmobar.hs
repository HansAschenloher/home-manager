Config { overrideRedirect = False
       , font     = "Roboto Bold 10"
       , additionalFonts =
          [ "FontAwesome 12"
          , "FontAwesome Bold 8"
          , "FontAwesome 14"
          , "Hack 19"
          , "Hack 14"
          ] 
       --, bgColor  = "#5f5f5f"
       --, fgColor  = "#f8f8f2"
       , alpha = 255
       , lowerOnStart = True
       , allDesktops = True
       , hideOnStart = False
       , position = TopSize L 100 25
       , commands = [ Run Weather "EGPF"
                        [ "--template", "<weather> <tempC>°C"
                        , "-L", "0"
                        , "-H", "25"
                        , "--low"   , "lightblue"
                        , "--normal", "#f8f8f2"
                        , "--high"  , "red"
                        ] 36000
                    , Run Cpu
                        [ "-L", "3"
                        , "-H", "50"
                        , "--high"  , "red"
                        , "--normal", "green"
                        ] 10
                    , Run Memory ["--template", "Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
                    , Run XMonadLog
                    ]
       , sepChar  = "%"
       , alignSep = "}{"
       , template = "%XMonadLog% }{ %cpu% | %memory% * %swap% | %EGPF% | %date% "
       }

