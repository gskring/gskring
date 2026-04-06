let run (module R : Sigs.RESOLVER) cache =
  let extensions = [ "avif"; "jpg"; "jpeg"; "png"; "svg" ] in
  Batch_copy.run
    ~extension:extensions
    ~source:R.Source.avatars
    ~target:R.Target.avatars
    cache
;;
