import XMonad

import qualified XMonad.StackSet as W
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Themes
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WindowSwallowing
import XMonad.Layout
import XMonad.Layout.Tabbed
import XMonad.Prompt
import XMonad.Prompt.OrgMode (orgPrompt)
import XMonad.Prompt.Pass

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "kitty"    -- Sets default terminal

myWorkspaces = [" dev ", " www ", " mus ", " doc " ]

mySpawnHook :: X ()
mySpawnHook = do
  spawnOnce "wal -i ~/wallpapers/gorgeus.jpg"
  spawnOnce "bash ~/me/dotfiles/polybar/material/launch.sh"

myKeys :: [(String , X () )]
myKeys =
  [

       ("<XF86AudioPlay>", spawn ("mocp --play"))
     , ("<XF86AudioPrev>", spawn ("mocp --previous"))
     , ("<XF86AudioNext>", spawn ("mocp --next"))
     , ("<XF86AudioMute>", spawn "amixer set Master toggle")
     , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
     , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
     , ("M-f", sendMessage ToggleStruts)
     , ("M-C-o", orgPrompt def "TODO" "~/todos.org")
     , ("M-C-p", passPrompt def)
     , ("M-C-l", spawn "xset dpms force off")
     , ("M-S-m", namedScratchpadAction scratchpads "spotify")
     , ("M-S-t", namedScratchpadAction scratchpads "term")
  ]

scratchpads = [
   NS "spotify" "spotify" (className =? "Spotify") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
 , NS "term" "kitty --name term" (resource =? "term") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
              ]
main :: IO ()
main = xmonad $ ewmh $ docks def
          {
            modMask         = myModMask
          , terminal        = myTerminal
          , workspaces      = myWorkspaces
          , startupHook     = mySpawnHook
          , borderWidth     = 0
          , layoutHook      = myLayout
          , handleEventHook = swallowEventHook (className =? "mpv" <||> className =? "feh") (return True)
          , manageHook      = namedScratchpadManageHook scratchpads
          } `additionalKeysP` myKeys

myLayout = avoidStruts $ tabbedBottom shrinkText myTabTheme ||| Full

myTabTheme = def {
                      activeColor  = "#ebcbba"
                    , inactiveColor = "#9B6764"
                  }
