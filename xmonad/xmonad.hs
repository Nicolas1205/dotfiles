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
import qualified XMonad.Layout.BinarySpacePartition as BSP
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

myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = "kitty"

myFont :: String
myFont = "xft:FiraCode Nerd Font:regular:size=9:antialias=true:hinting=true"

myBorderWidth :: Dimension
myBorderWidth = 5 -- Sets border width for windows

myNormColor :: String
myNormColor = "#756F87" -- Border color of normal windows

myFocusColor :: String
--myFocusColor  = "#ebcbba"   -- Border color of focused windows
myFocusColor = "#D76E74"

--windowCount :: X (Maybe String)
--windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myStartupHook :: X ()
myStartupHook = do
  --spawnOnce "picom &"
  spawnOnce "wal -i wallpapers/sunset.jpg"
  spawnOnce "bash ~/.config/polybar/material/launch.sh"
  spawnOnce "alacritty"

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook =
  composeAll
    [ className =? "spotify" --> doShift (myWorkspaces !! 2),
      className =? "emacs" --> doShift (head myWorkspaces),
      --className =? "kitty" --> doShift (head myWorkspaces),
      className =? "qutebrowser" --> doShift (myWorkspaces !! 1)
    ]

monocle =
  renamed [Replace "monocle"] $
    smartBorders $
      addTabs shrinkText def $
        subLayout [] (smartBorders Simplest) $
          limitWindows 20 Full

floats =
  renamed [Replace "floats"] $
    smartBorders $
      limitWindows 20 simplestFloat

tabs = renamed [Replace "tabs"] $ tabbed shrinkText def

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myLayoutHook =
  avoidStruts $
    mouseResize $
      windowArrange $
        T.toggleLayouts floats $
          mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout = tabs ||| monocle

myTabTheme =
  def
    { fontName = myFont,
      activeColor = "#9C6764",
      inactiveColor = "#B88676",
      activeBorderColor = "#9C6764",
      inactiveBorderColor = "#B88676",
      activeTextColor = "#282c34",
      inactiveTextColor = "#d0d0d0"
    }

-- Theme for showWName which prints current workspace when you change workspaces.
myShowWNameTheme :: SWNConfig
myShowWNameTheme =
  def
    { swn_font = "xft:Ubuntu:bold:size=60",
      swn_fade = 1.0,
      swn_bgcolor = "#1c1f24",
      swn_color = "#ffffff"
    }

myWorkspaces = ["</>", "www", "mus", "chats", "servers", "docs"]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1 ..] -- (,) == \x y -> (x,y)

clickable ws = "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices

myKeys :: [(String, X ())]
myKeys =
  [ ("<XF86AudioPrev>", spawn "playerctl previous"),
    ("<XF86AudioNext>", spawn "playerctl next"),
    ("<Print>", spawn "shot"),
    ("<XF86AudioPlay>", spawn "playerctl play-pause"),
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle"),
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%"),
    ("<XF86Search>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
    ("M-f", sendMessage (MT.Toggle NBFULL))
  ]

outerGaps = 0

myGaps = gaps [(U, outerGaps), (R, outerGaps), (L, outerGaps), (D, outerGaps)]

addSpace = renamed [CutWordsLeft 2] . spacing 5

tab =
  avoidStruts $
    renamed [Replace "Tabbed"] $
      myGaps $
        tabbed shrinkText myTabTheme

layouts =
  avoidStruts $
    -- renamed [CutWordsLeft 1] $
    renamed [Replace "BSP"] $
      addTabs shrinkText myTabTheme $
        subLayout [] Simplest $
          myGaps $
            addSpace BSP.emptyBSP
              ||| tab

myLayout =
  smartBorders $
    mkToggle (NOBORDERS ?? NBFULL ?? EOT) layouts

main = do
  xmonad $
    ewmh
      def
        { manageHook = myManageHook <+> manageDocks, -- manageHook = manageDocks
          handleEventHook = docksEventHook,
          modMask = myModMask,
          terminal = myTerminal,
          startupHook = myStartupHook,
          --layoutHook = showWName' myShowWNameTheme myLayoutHook,
          layoutHook = myLayout,
          workspaces = myWorkspaces,
          borderWidth = myBorderWidth,
          normalBorderColor = myNormColor,
          focusedBorderColor = myFocusColor
        }
      `additionalKeysP` myKeys
