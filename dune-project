(lang dune 3.20)

(generate_opam_files false)
(executables_implicit_empty_intf true)

(name ring)
(version dev)
(source (github gskring/gskring))
(license GPL-3.0-or-later)
(authors "Xavier Van de Woestyne <xaviervdw@gmail.com>")
(maintainers "Xavier Van de Woestyne <xaviervdw@gmail.com>")

(package
  (name ring)
  (depends
   ocaml
   cmdliner
   yocaml
   yocaml_eio
   yocaml_jingoo
   yocaml_omd
   yocaml_syndication
   yocaml_yaml
   (ppx_expect :with-test)))
