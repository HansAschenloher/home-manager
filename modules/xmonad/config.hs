import XMonad
-- XMobar

import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig (additionalKeysP)

--------------------------------------------------------------------------------

myTerminal = "alacritty"

myScreenshot = "flameshot gui"

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol ||| simpleTabbed
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1 -- Default number of windows in the master pane
    ratio = 0.65 -- Default proportion of screen occupied by master pane
    delta = 3 / 100 -- Percent of screen to increment by when resizing panes

myConfig =
  def
    { modMask = mod1Mask,
      layoutHook = avoidStruts $ myLayout,
      terminal = myTerminal
    }
    `additionalKeysP` [ ("M-f", spawn "firefox"),
                        ("M-x", kill),
                        ("M-p", spawn "rofi -show drun"),
                        ("M-s", sendMessage ToggleStruts),
                        ("M-S-l", spawn "i3lock-fancy"),
                        ("M-S-p", spawn myScreenshot),
                        ("M-k", nextScreen),
                        ("M-j", prevScreen),
                        ("M-S-k", shiftNextScreen),
                        ("M-S-j", shiftPrevScreen)
                      ]

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ myConfig
