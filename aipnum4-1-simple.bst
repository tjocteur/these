%% aipnum4-1-simple.bst
%% Minimaliste, compatible avec book, citations numériques
%%
%% Usage:
%% \bibliographystyle{aipnum4-1-simple}
%% \bibliography{biblio}

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    doi
    url
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
}

FUNCTION {output.nonnull}
{ 'skip$ }

FUNCTION {format.names}
{ 's :=
  s #1 "{ff~}{vv~}{ll}{, jj}" format.name$
  s #2 global.max.names =
    { " et~al." * }
    { "" }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {format.journal}
{ journal empty$
    { "" }
    { journal "t" change.case$ }
  if$
}

FUNCTION {format.volume}
{ volume empty$
    { "" }
    { " \textbf{" volume * "}" * }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { ", " pages * }
  if$
}

FUNCTION {format.year}
{ year empty$
    { "" }
    { " (" year * ")" * }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { ", DOI: \texttt{" doi * "}" * }
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    { ", URL: \texttt{" url * "}" * }
  if$
}

FUNCTION {article}
{ output.bibitem
  author format.names output
  ", " *
  format.title output
  ". " *
  format.journal output
  format.volume output
  format.pages output
  format.year output
  format.doi output
  format.url output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author format.names output
  ", " *
  format.title output
  ". " *
  publisher output
  format.year output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  author format.names output
  ", " *
  format.title output
  ". In " *
  editor format.names output
  ", " *
  booktitle output
  ", " *
  pages output
  format.year output
  fin.entry
}

FUNCTION {output.bibitem}
{ "\bibitem{" write$
  label write$
  "}" write$ newline$
}

FUNCTION {begin.bib}
{ "" }
FUNCTION {end.bib}
{ "" }

READ
ITERATE {call.type$}
EXECUTE {end.bib}

