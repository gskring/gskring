let run (module R : Sigs.RESOLVER) chain =
  Yocaml.Action.Static.write_file_with_metadata
    R.Target.articles
    (let open Yocaml.Task in
     R.track_common_dependencies
     >>> Yocaml.Pipeline.track_file R.Source.entries
     >>> Yocaml_yaml.Pipeline.read_file_with_metadata
           (module Model.Page)
           R.Source.articles
     >>> Static.on_metadata @@ Model.Articles.index chain R.Source.entries
     >>> Yocaml_omd.content_to_html ()
     >>> Yocaml_liquid.Pipeline.as_template
           (module Model.Articles)
           (R.Source.template "articles.liquid")
     >>> Yocaml_liquid.Pipeline.as_template
           (module Model.Articles)
           (R.Source.template "main.liquid"))
;;
