import «Colorized».Console.Colorized

def main : IO Unit := do
  -- | Simple style
  IO.println (Colorized.style Style.Underline "Hello, world!")

  -- | Simple color
  IO.println (Colorized.color Color.Cyan "Hello, world!")

  -- | Combine style and color
  IO.println (Colorized.color Color.Magenta (Colorized.style Style.Underline "Hello, world!"))
