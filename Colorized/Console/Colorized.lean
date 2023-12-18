inductive Section
  | Foreground
  | Background

inductive Color
  | Black
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan
  | White
  | Default

instance : Repr Color where
  reprPrec
  | Color.Black, _ => "0"
  | Color.Red, _ => "1"
  | Color.Green, _ => "2"
  | Color.Yellow, _ => "3"
  | Color.Blue, _ => "4"
  | Color.Magenta, _ => "5"
  | Color.Cyan, _ => "6"
  | Color.White, _ => "7"
  | Color.Default, _ => "9"

inductive Style
  | Normal
  | Bold
  | Faint
  | Italic
  | Underline
  | SlowBlink
  | ColoredNormal
  | Reverse

instance : Repr Style where
  reprPrec
  | Style.Normal, _ => "0"
  | Style.Bold, _ => "1"
  | Style.Faint, _ => "2"
  | Style.Italic, _ => "3"
  | Style.Underline, _ => "4"
  | Style.SlowBlink, _ => "5"
  | Style.ColoredNormal, _ => "6"
  | Style.Reverse, _ => "7"

class Colorized (α : Type) where
  colorize : Section → Color → α → α
  style : Style → α → α
  bgColor := colorize Section.Background
  color := colorize Section.Foreground

def const := "\x1b["
def reset := "\x1b[0m"

instance : Colorized String where
  colorize sec col str :=
    let sectionNum :=
      match sec with
      | Section.Foreground => "9"
      | Section.Background => "4"
    s!"{const}{sectionNum}{repr col}m{str}{reset}"

  style sty str :=
    s!"{const}{repr sty}m{str}{reset}"
