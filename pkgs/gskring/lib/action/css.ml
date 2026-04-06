let run (module R : Sigs.RESOLVER) =
  Yocaml.Action.exec_cmd
    (fun target ->
       Yocaml.Cmd.make
         "tailwindcss"
         [ Yocaml.Cmd.param "input" (Yocaml.Cmd.w R.Source.css)
         ; Yocaml.Cmd.flag "m"
         ; Yocaml.Cmd.param "output" target
         ])
    R.Target.css
;;
