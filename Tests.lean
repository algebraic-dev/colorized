import Specs
import Specs.Macro

import «Colorized».Console.Colorized

open Specs
open Specs.Matchers
open Specs.Macro

def colorizedTests := do
  describe "check if strings are built correctly" do
    it "should be built with an underline" do
      isEqual (Colorized.style Style.Underline "Hello, world!") "\x1b[4mHello, world!\x1b[0m"

    it "should be built with cyan color" do
      isEqual (Colorized.color Color.Cyan "Hello, world!") "\x1b[96mHello, world!\x1b[0m"

    it "should be built with magenta color and underline" do
      isEqual (Colorized.color Color.Magenta (Colorized.style Style.Underline "Hello, world!")) "\x1b[95m\x1b[4mHello, world!\x1b[0m\x1b[0m"

def main :=
  runCli do
    colorizedTests
