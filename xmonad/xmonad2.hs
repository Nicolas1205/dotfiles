-- import qualified DBus as D
-- import qualified DBus.Client as D
-- import qualified Data.Map as M
-- import Data.Maybe (fromJust, isJust)
-- import XMonad
-- import XMonad.Actions.MouseResize (mouseResize)
-- import XMonad.Hooks.EwmhDesktops
-- import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docksEventHook, manageDocks)
-- import XMonad.Layout.LayoutModifier
-- import XMonad.Layout.LimitWindows (decreaseLimit, increaseLimit, limitWindows)
-- import XMonad.Layout.MultiToggle (EOT (EOT), mkToggle, single, (??))
-- import XMonad.Layout.MultiToggle.Instances
-- import XMonad.Layout.NoBorders (smartBorders)
-- import XMonad.Layout.Renamed
-- import XMonad.Layout.Simplest
-- import XMonad.Layout.SubLayouts
-- import XMonad.Layout.Tabbed
-- import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
-- import XMonad.Layout.WindowArranger (windowArrange)
-- import XMonad.Util.EZConfig (additionalKeysP)
-- import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
-- import XMonad.Util.SpawnOnce (spawnOnce)
--import XMonad.Util.Ungrab

import qualified Codec.Binary.UTF8.String as UTF8
import qualified DBus as D
import qualified DBus.Client as D
import Data.Char (isSpace, toUpper)
import qualified Data.Map as M
import Data.Maybe (fromJust, isJust)
import Data.Monoid
import Data.Tree
import System.Directory
import System.Exit (exitSuccess)
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (Direction1D (..), WSType (..), moveTo, nextScreen, prevScreen, shiftTo)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotAllDown, rotSlavesDown)
import qualified XMonad.Actions.Search as S
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (killAll, sinkAll)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docksEventHook, manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory
import XMonad.Layout.Accordion
import XMonad.Layout.Gaps (gaps)
import XMonad.Layout.GridVariants (Grid (Grid))
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (decreaseLimit, increaseLimit, limitWindows)
import XMonad.Layout.Magnifier
import XMonad.Layout.Minimize (minimize)
import XMonad.Layout.MultiToggle (EOT (EOT), mkToggle, single, (??))
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect (REFLECTX (REFLECTX))
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..), windowArrange)
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

main :: IO ()
main = do
  xmonad $
    ewmh
      def
        { modMask = myModMask,
          terminal = myTerminal,
          startupHook = myStartupHook,
          layoutHook = myLayoutHook,
          workspaces = myWorkspaces,
          borderWidth = myBorderWidth,
          normalBorderColor = myNormColor,
          focusedBorderColor = myFocusColor
        }
      `additionalKeysP` myKeys

-- Basic Config

myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = "kitty"

myBorderWidth :: Dimension
myBorderWidth = 5

myNormColor :: String
myNormColor = "#756F87"

myFocusColor :: String
myFocusColor = "#D76E74"

-- ======================= StartuHook  ======================

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "bash ~/.config/polybar/material/launch.sh"
  spawnOnce "wal -i wallpapers/sunset.jpg"
  spawnOnce myTerminal

-- ==================== LayoutHook  ===========================

myLayoutHook =
  avoidStruts $
    mouseResize $
      windowArrange $
        T.toggleLayouts floats $
          mkToggle (NBFULL ?? NOBORDERS ?? EOT) myLayout
  where
    myLayout = tabs ||| monocle

-- ======= Layouts  ==========

floats =
  renamed [Replace "floats"] $
    smartBorders $
      limitWindows 20 Full

monocle =
  renamed [Replace "monocle"] $
    smartBorders $
      addTabs shrinkText def $
        subLayout [] (smartBorders Simplest) $
          limitWindows 20 Full

tabs = renamed [Replace "tabs"] $ tabbed shrinkText def

-- =============== Key Bidings ===================

myKeys :: [(String, X ())]
myKeys =
  [ ("<XF86AudioPrev>", spawn "playerctl previous"),
    ("<XF86AudioNext>", spawn "playerctl next"),
    ("<Print>", spawn "shot"),
    ("<XF86AudioPlay>", spawn "playerctl play-pause"),
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle"),
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%"),
    ("<XF86Search>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  ]

--- ===================== Workspaces ===========================

myWorkspaces = ["</>", "www", "mus", "chats", "servers", "docs"]

myWorkspaceIndices = M.fromList $ zip myWorkspaces [1 ..] -- (,) == \x y -> (x,y)

clickable ws = "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices
