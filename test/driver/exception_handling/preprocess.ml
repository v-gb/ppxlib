open Ppxlib

let () =
  Driver.V2.(
    register_transformation
      ~preprocess_impl:(fun ctxt str ->
        let loc =
          match str with
          | [] -> Location.in_file (Expansion_context.Base.input_name ctxt)
          | hd :: _ -> hd.pstr_loc
        in
        Location.raise_errorf ~loc "A located error in a preprocess")
      "raise_in_preprocess")

let () = Ppxlib.Driver.standalone ()