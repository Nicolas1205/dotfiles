import XMonad
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W
import XMonad.Hooks.EwmhDesktops

import XMonad.Util.SpawnOnce

import XMonad.Util.EZConfig (additionalKeysP)

--import qualified DBus as D
--import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

myFont :: String
myFont = "xft:FiraCode Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "kitty"    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox"  -- Sets qutebrowser as browser

myEmacs :: String
myEmacs = "emacs"  -- Makes emacs keybindings easier to type

myEditor :: String
myEditor = "emacs"  -- Sets emacs as editor

-- myEditor = myTerminal ++ " -e vim "    -- Sets vim as editor

myBorderWidth :: Dimension
myBorderWidth = 0           -- Sets border width for windows

myNormColor :: String
myNormColor   = "#282c34"   -- Border color of normal windows

myFocusColor :: String
myFocusColor  = "#46d9ff"   -- Border color of focused windows

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


myWorkspaces = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]

mySpawnHook :: X ()
mySpawnHook = do
  spawnOnce "wal -i ~/Images/gorgeus.jpg"
  spawnOnce "kitty"

myKeys :: [(String , X () )]
myKeys =
  [
     ("<XF86AudioPlay>", spawn (myTerminal ++ "mocp --play"))
     , ("<XF86AudioPrev>", spawn (myTerminal ++ "mocp --previous"))
     , ("<XF86AudioNext>", spawn (myTerminal ++ "mocp --next"))
     , ("<S-t>", spawn "amixer set Master toggle")
     , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
     , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
  ]


main :: IO ()
main =	xmonad $ ewmh def
          {
          modMask            	 = myModMask
          , terminal           = myTerminal
          , workspaces         = myWorkspaces
          , focusedBorderColor = myFocusColor
          , startupHook        = mySpawnHook
	  			, borderWidth		     = 0
          } `additionalKeysP` myKeys
