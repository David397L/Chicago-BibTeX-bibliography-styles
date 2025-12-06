%%% ====================================================================
%%%  @BibTeX-style-file{
%%%     author          = "David Lamkin",
%%%     version         = "B.04",
%%%     date            = "5 December 2025",
%%%     filename        = "chicago18ad.bst",
%%%     address         = "",
%%%     checksum        = "",
%%%     email           = "formatwithstyle@outlook.com",
%%%     supported       = "yes",
%%%     abstract        = "The file produces bibliographies more or
%%%                        less in Chicago author-date (eighteenth 
%%%                        edition) format. 
%%%                        It incorporates features of Glenn Paulley's 
%%%                        chicago.bst, Matt Swift's achicago.bst and 
%%%                        Patrick W. Daly and Arthur Ogawa's merlin.mbs".
%%%
%%%     Usage: The preamble of the .tex document has to contain at least:
%%%
%%%     \usepackage[sort]{natbib}
%%%     \bibpunct[, ]{(}{)}{;}{a}{}{,}
%%%
%%%     The inclusion of
%%%
%%%     \usepackage{doi} 
%%%     \renewcommand{\doitext}{https://doi.org/}
%%%
%%%     (or equivalent) is also required in order to hyperlink DOI 
%%%     numbers to doi.org and output the appropriate text prefix. 
%%%  }
%%% ====================================================================
%
% BibTeX `chicago18ad' bibliography style (05-Dec-25 version)
% An adaptation of the `plainnat' style, for use with the natbib package.
% Copyright (C) 2025, all rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `chicago18ad.bst'. 
% This restriction helps ensure that all copies are identical.
%
% This style should be used with the `natbib' LaTeX style (natbib.sty).
% The form of the \bibitem entries is
%   \bibitem[Jones et al.(1990)]{key}...
%   \bibitem[Jones et al.(1990)Jones, Baker and Smith]{key}...
% The essential feature is that the label (the part in brackets) consists
% of the author names, as they should appear in the citation, with the year
% in parentheses following. There must be no space before the opening
% parenthesis!
% \cite's come out like "(Jones 1990)" in the text but there are no labels
% in the bibliography, and something like "1990" comes out immediately
% after the author. A `year' field is required for every entry, and so is 
% either an author (or an editor) field or a key field.
%

ENTRY
  { address
    author
    booktitle
    chapter
    collaboration
    doi
    edition
    editor
    eid
    howpublished
    institution
    journal
    key
    lastchecked
    month
    note
    number
    numpages
    organization
    pages
    publisher
    school
    series
    serieseditor
    title
    type
    url
    urldate
    volume
    year
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$	
  write$ 
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  
  " " * before.all 'output.state :=
}

FUNCTION {no.blank.or.punct}
{  
  "" * before.all 'output.state :=
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {parenthesize}
{ duplicate$ empty$
    { pop$ "" }
    { "(" swap$ * ")" * }
  if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {comma}
{ "," }

FUNCTION {period}
{ "." }

FUNCTION {hyphen}
{ "-" }

FUNCTION {colon}
{ ":" }

FUNCTION {space}
{ " " }

FUNCTION {space.word}
{ " " swap$ * " " * }

% Here are the language-specific definitions for explicit words.
% Each function has a name bbl.xxx where xxx is the English word.

FUNCTION {bbl.accessed}
{ "accessed" }

FUNCTION {bbl.and}
{ "and" }

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.editors}
{ "eds" }

FUNCTION {bbl.editor}
{ "ed" }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "ed" }	

FUNCTION {bbl.volume}
{ "vol." }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "no." }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "p." }

FUNCTION {bbl.page}
{ "p." }

FUNCTION {bbl.eidpp}
{ "pages" }

FUNCTION {bbl.chapter}
{ "chapter" }

FUNCTION {bbl.techrep}
{ "Technical {R}eport" }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "PhD diss." }

FUNCTION {bbl.first}
{ "1st" }

FUNCTION {bbl.second}
{ "2nd" }

FUNCTION {bbl.third}
{ "3rd" }

FUNCTION {bbl.fourth}
{ "4th" }

FUNCTION {bbl.fifth}
{ "5th" }

FUNCTION {bbl.st}
{ "st" }

FUNCTION {bbl.nd}
{ "nd" }

FUNCTION {bbl.rd}
{ "rd" }

FUNCTION {bbl.th}
{ "th" }

FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bbl.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bbl.st * }
         { duplicate$ "2" =
             { pop$ bbl.nd * }
             { "3" =
                 { bbl.rd * }
                 { bbl.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }

STRINGS { bibinfo }

FUNCTION {format.names}
%
% Format bibliographical entries with the first author surname first,
% and subsequent authors with first name followed by surname.
% All names are formatted in this routine.
% Include the names of up to six authors in the list.
% If there are more than six, list the first three, followed by "et al."
%
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      duplicate$ #1 >
        { "{ff~}{vv~}{ll}{, jj}" }
        { "{vv~}{ll}{, ff}{, jj}" }
      if$
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        { nameptr #3
          #1 + =
          numnames #6
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                { " " * bbl.etal * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
   while$
   }
 if$
}

FUNCTION {format.names.firstfirst}
%
% Format names with first name followed by surname every time.
% Like format.names, ALL names are formatted.
%
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ff~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " " * bbl.etal * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } 
 if$
}

FUNCTION {format.authors}
{ author "author" format.names
    duplicate$ empty$ 'skip$
    { collaboration "collaboration" bibinfo.check
      duplicate$ empty$ 'skip$
        { " (" swap$ * ")" * }
      if$
      *
    }
  if$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors.firstfirst}
%
% Format editor names for use in inbook, incollection, inproceedings: 
% first name followed by surname every time.
% When editors are the LABEL for an entry, then format.editors 
% is used, which lists the first editor surname first.
%
{ editor empty$
    { "" }
    { editor "editor" format.names.firstfirst }
  if$
}

FUNCTION {get.bbl.editor}
{ editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor "editor" format.names
      editor num.names$ #1 >
        { ", " * bbl.editors * }
        { ", " * bbl.editor * }
      if$
    }
  if$
}

FUNCTION {format.editors.primary}
%
% Editors in primary position in {book} and {inbook}
% when there is no author.
%
{ editor "editor" format.names duplicate$ empty$ 'skip$
    {
      ", " * get.bbl.editor *
    }
  if$
}

FUNCTION {format.editors.secondary}
%
% Editors in secondary position in {book} and {inbook}
% when there is an author in primary position.
%
{ editor empty$
    { "" }
    { author empty$
        { "" }
        { editor "editor" format.names.firstfirst
          editor num.names$ #1 >
            { bbl.edby capitalize " " * swap$ * }
            { bbl.edby capitalize " " * swap$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.serieseditors}
%
% The editor of a book series (not an individual volume). 
% The name of the series editor is usually omitted. 
% When included, it directly follows the series title,
% after a comma, without capitalizing "edited by".
%
{ serieseditor empty$
    { "" }
    { author empty$
        { "" }
        { serieseditor "editor" format.names.firstfirst
          serieseditor num.names$ #1 >
            { bbl.edby " " * swap$ * }
            { bbl.edby " " * swap$ * }
          if$
        }
      if$
    }
  if$
  mid.sentence 'output.state :=
}

FUNCTION {urldate.check}
{ lastchecked empty$
    { urldate empty$
        { "" }
        { bbl.accessed capitalize " " * urldate * add.period$ }
      if$
    }
    { bbl.accessed capitalize " " * lastchecked * add.period$ }
  if$
}

FUNCTION {format.doi.or.url}
%
% Include the DOI if available, or else the URL.
%
{ doi empty$
    { url duplicate$ empty$
        { pop$ "" }
        { urldate.check " " * "\url{" * swap$ * "}" * }
      if$
    }
    { "\doi{" doi * "}" * }
  if$
}

FUNCTION {format.title.plain}
%
% Format a title without quotation marks.
%
{ title empty$
    { "" }
    { title }
  if$
}

FUNCTION {format.title}
%
% Format a title within quotation marks.
%
{ title "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      "``" swap$ *
    add.period$ "'' " *
    }
  if$
}

FUNCTION {end.quote.title}
%
% Completes quotation marks around title, including
% punctuation mark (in place of a new.block).
%
{ title empty$
    'skip$
    { before.all 'output.state := }
  if$
}

FUNCTION {format.full.names}
{'s :=
 "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}" format.name$
      't :=
      nameptr #1 >
        { nameptr #3
          #1 + =
          numnames #6
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            { s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                { " " * bbl.etal * }
                { numnames #2 >
                    { "," * }
                    'skip$
                  if$
                  bbl.and
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
%
% Include the extended list of entry types here?
%
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.full
    { type$ "proceedings" =
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in capitalize " " * }

FUNCTION {format.date}
{ year "year" bibinfo.check duplicate$ empty$
    {
      "empty year in " cite$ * "; set to n.d." * warning$
       pop$ "{n.d.}"
    }
    'skip$
  if$
  extra.label *
  before.all 'output.state := 
  after.sentence 'output.state := 
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s eng.ord 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    { convert.edition
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}

FUNCTION {format.btitle}
{ edition empty$
  { title emphasize }
  { title empty$
    { title emphasize }
    { volume empty$
        { "\emph{" title * "}. " * format.edition * "." * }
        { "\emph{" title * "}. " * format.edition * }
      if$
      }
    if$
    }
  if$
}

FUNCTION {format.emphasize.booktitle}
{ edition empty$
  { booktitle emphasize }
  { booktitle empty$
    { booktitle emphasize }
    { volume empty$
        { "\emph{" booktitle * "}, " * format.edition * "." * }
        { "\emph{" booktitle * "}, " * format.edition * }
      if$
      }
    if$
    }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {tie.or.space.prefix} % (from merlin)
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {either.or.both.check}
%
% Issues a warning (for information) when both author and editor
% are used in {book} and {inbook}
%
{ empty$
    'pop$
    { "" swap$ * " fields both used in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { " " }
    { bbl.volume capitalize volume tie.or.space.prefix
      "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$ emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "" }
            { "" }
          if$
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { series "series" bibinfo.check *
              number tie.or.space.prefix "number" bibinfo.check * * }
          if$
        }
      if$
    }
    { "" }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
%
% Retained for use in format.chapter.pages to provide
% this functionality to book crossrefs. 
%
{ pages empty$
    { "" }
    { pages multi.page.check
        { pages n.dashify }
        { pages }
      if$
    }
  if$
}

FUNCTION {format.journal.pages}
%
% Occurs in journal crossrefs
%
{ pages duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$
        { pop$ pop$ format.pages }
        {
          ": " *
          swap$
          n.dashify
          "pages" bibinfo.check
          *
        }
      if$
    }
  if$
}

FUNCTION {format.journal.eid}
%
% Occurs in journal crossrefs
%
{ eid "eid" bibinfo.check
  duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$ 'skip$
      {
        ". " *	
      }
      if$
      swap$ *
      numpages empty$ 'skip$
        { bbl.eidpp numpages tie.or.space.prefix
          "numpages" bibinfo.check * *
          " (" swap$ * ")" * *
        }
      if$
    }
  if$
}

FUNCTION {format.eid}
{ eid empty$
    { "" }
    { "" eid tie.or.space.connect }
  if$
}

FUNCTION {format.vol.num.month.pages}
%
% Format volume, number, month, pages for article types
%
% There are four relevant fields, each of which can be empty or not.
% In the comments below, each case is marked with a series of 1 to 4 letters
% to represent the cases where that field is non-empty: 
% V for volume, N for number, M for month and P for pages. 
% Thus, the case marked with the comment % MP is the one where the
% month and pages fields are non-empty, and volume and number are empty.
%
{ volume empty$
   { number empty$
      { month empty$
        { pages empty$
                % none of VNMP
            { "page numbers missing in " cite$ * warning$   
              add.period$ space * "" 
            }
                % P
            { duplicate$ empty$
                { "page numbers but no volume, number or month in " cite$ * warning$ 
                  ", " * bbl.page pages
                }
                { "page numbers but no volume, number or month in " cite$ * warning$
                  ", " * bbl.pages pages n.dashify
                }
              if$
              tie.or.space.connect 
            }
          if$
        }
        { pages empty$
                % M   % Most likely a news or magazine article
            { 
              comma space * month * 
            }
                % MP  % May also be a news or magazine article
            { 
              space * month parenthesize colon * space * format.pages *
            }
          if$
          }
        if$
        }
        { month empty$
        { pages empty$
                % N
            { 
              "number but no volume, month, pages or eid in " cite$ * warning$   
              ", " * bbl.nr number tie.or.space.connect
            }
                % NP
            { 
              comma * space * bbl.nr number colon * space * format.pages * 
              tie.or.space.connect
            }
          if$
        }
        { pages empty$
                % NM   % Might be a news article, so we need the month
            { 
              bbl.nr number tie.or.space.connect
              space * month parenthesize *
            }
                % NMP  % Might be a news article, so we need the month
            { 
              bbl.nr number tie.or.space.connect
              space * month parenthesize *
              colon * space * format.pages *
            }
          if$
        }
          if$
        }
      if$
        }
        { number empty$
        { month empty$
        { pages empty$
               % V
            { 
              bbl.volume volume tie.or.space.connect *
            }
               % VP
            { 
              space * volume colon * space * format.pages *
            }
          if$
        }
        { pages empty$
               % VM
            { 
              bbl.volume volume tie.or.space.connect
              space * month parenthesize *
            }
               % VMP
            { 
              space * volume space *
              month parenthesize * colon * space * format.pages *
            }
          if$
        }
          if$
        }
        { month empty$                
        { pages empty$
               % VN    % Maybe a special issue of a journal
            { 
              space * volume comma * space * 
              bbl.nr number tie.or.space.connect * 
            }
               % VNP   % A standard journal article
            { 
              space * volume space * 
              number parenthesize * colon * space * format.pages *
            }
          if$
        }
        { pages empty$
               % VNM   % We have volume and number, so don't output the month
            { 
              space * volume comma * space * 
              bbl.nr number tie.or.space.connect * 
            }
               % VNMP  % We have volume and number, so don't output the month
            { 
              space * volume space * number parenthesize * colon * space *
              format.pages * 
            }
        if$
        }
      if$
      }
    if$
    }
  if$
}

FUNCTION {format.vol.num.month.eid}
%
% Format volume, number, month, eid for article types
%
% There are four relevant fields, each of which can be empty or not.
% In the comments below, each case is marked with a series of 1 to 4 letters
% to represent the cases where that field is non-empty: 
% V for volume, N for number, M for month and E for eid. 
% Thus, the case marked with the comment % ME is the one where the
% month and eid fields are non-empty, and volume and number are empty.
%
{ volume empty$
   { number empty$
      { month empty$
        { eid empty$
                % none of VNME
            { "eid missing in " cite$ * warning$
              add.period$ space * ""
            }
                % E
            { "eid but no volume, number or month in " cite$ * warning$
              ": " format.eid *
		}
          if$
	 }
	 { eid empty$
                % M
            { 
              "" 
            }
                % ME  % A news or magazine article with an eid?
            { 
              space * month parenthesize colon * space * format.eid * 
            }
          if$
        }
        if$
      }
    { month empty$
	{ eid empty$
                % N   % Warning output by format.vol.num.month.pages
            { 
              "" 
            }
                % NE
            { 
              comma * space * bbl.nr number colon * space * format.eid * 
              tie.or.space.connect
            }
          if$
        }
        { eid empty$
                % NM
            { 
              "" 
            }
                % NME  % A news or magazine article with an eid?
            { 
              bbl.nr number tie.or.space.connect
              space * month parenthesize *
              colon * space * format.eid *
            }
          if$
        }
          if$
        }
      if$
        }
        { number empty$
        { month empty$
        { eid empty$
                % V
            { 
              "" 
            }
                % VE
            { 
              space * volume colon * format.eid * 
            }
          if$
        }
        { eid empty$
               % VM
            { 
              "" 
            }
               % VME
            { 
              space * volume space * 
              month parenthesize * colon * space * format.eid * 
            }
          if$
        }
          if$
        }
        { month empty$                
        { eid empty$
               % VN
            { 
              ""  
            }
               % VNE   % A standard journal article with an eid
            { 
              space * volume space * 
              number parenthesize * colon * space * format.eid *
            }
          if$
        }
        { eid empty$
               % VNM
            { 
              "" 
            }
               % VNME  % We have volume and number, so don't output the month
            { 
              space * volume space * number parenthesize * colon * space *
              format.eid *
            }
          if$
        }
      if$
      }
    if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter capitalize }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.booktitle}
{ booktitle "booktitle" bibinfo.check
  emphasize
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in format.emphasize.booktitle * }
        { word.in * format.emphasize.booktitle * ", " bbl.edby * 
          " " * format.editors.firstfirst * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
%
% Since we are adding editor to FUNCTION {misc} ...
% we need to add that to the list of fields here.
%
{ author empty$ editor empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$ 
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume capitalize volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ word.in			
  " \cite{" * crossref * "}" *
}

FUNCTION {format.conference.address} 
%
% Occurs in {inproceedings} and {proceedings}
%
{ address "address" bibinfo.check
}

FUNCTION {format.month}
{ month empty$
    { "" }
    { month "month" bibinfo.check
    "" swap$ * "" * }
  if$
}

FUNCTION {article}
%
% Includes "author or editor" routine to enable citing 
% a special issue/section of a journal by its editor(s).
%
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  new.block
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { journal emphasize
      "journal" bibinfo.check
      "journal" output.check
      no.blank.or.punct
      eid empty$
        { format.vol.num.month.pages output }
        { format.vol.num.month.eid output }
      if$
    }  
    { format.article.crossref output.nonnull
      eid empty$
        { format.journal.pages }
        { format.journal.eid }
      if$
    }
  if$
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {magazine} { article }
%
% Allow @magazine as an alias for @article

FUNCTION {newspaper} { article }
%
% Allow @newspaper as an alias for @article

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors.primary "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.both.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  new.block	
  format.btitle "title" output.check
  new.sentence
  crossref missing$
    { format.bvolume output
      new.sentence
      format.editors.secondary output
      new.sentence
      format.number.series output
      format.serieseditors output
      new.sentence
      publisher "publisher" output.check
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  new.block
  howpublished output
  new.sentence
  address output	
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors.primary "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.both.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  new.block
  format.btitle "title" output.check
  new.sentence
  crossref missing$
    { format.bvolume output
      new.sentence
      format.editors.secondary output
      new.sentence
      format.number.series output
      format.serieseditors output
      new.sentence
      publisher "publisher" output.check
      new.sentence
      format.chapter.pages "chapter and pages" output.check
    }
    { format.chapter.pages "chapter and pages" output.check
      new.sentence
      format.book.crossref output.nonnull
    }
  if$
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      new.sentence
      format.bvolume output
      new.sentence
      format.number.series output
      format.serieseditors output
      new.sentence
      publisher "publisher" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  end.quote.title
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.month output
      format.conference.address output
      new.sentence
      organization output
      publisher output
      format.pages "pages" output.check
      new.sentence
      format.number.series output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages "pages" output.check
    }
  if$
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        { author format.key output }
        { organization output.nonnull }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.date "year" output.check
  new.block
  format.btitle "title" output.check
  new.sentence
  organization output
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  end.quote.title
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {misc}
%
% Includes optional "author or editor" routine 
% to enable citing an item by its editor(s)
%
{ output.bibitem
  author empty$
    { editor empty$
        'skip$  % author and editor both optional
        { format.editors output.nonnull }
      if$
    }
    { editor empty$
        { format.authors output.nonnull }
        { "can't use both author and editor fields in " cite$ * warning$ }
      if$
    }
  if$
  author format.key output
  format.date "year" output.check
  new.block
  url empty$
    { format.title.plain "title" output.check }
    { format.title "title" output.check
      end.quote.title }
  if$ 
  new.sentence
  howpublished output
  format.month output
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {webpage} { misc }
%
% Allow @webpage as an alias for @misc

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  end.quote.title
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  format.date "year" output.check
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.month output
  format.conference.address output
  new.sentence
  organization output
  publisher output
  new.sentence
  format.number.series output
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  format.month output
  new.block
  format.title "title" output.check
  end.quote.title
  format.tr.number output.nonnull
  new.sentence
  institution "institution" output.check
  address output
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  format.month output
  new.block
  format.title "title" output.check
  end.quote.title
  note "note" output.check
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {acmcs} {"ACM Computing Surveys"}
MACRO {acta} {"Acta Informatica"}
MACRO {cacm} {"Communications of the ACM"}
MACRO {ibmjrd} {"IBM Journal of Research and Development"}
MACRO {ibmsj} {"IBM Systems Journal"}
MACRO {ieeese} {"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} {"IEEE Transactions on Computers"}
MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} {"Information Processing Letters"}
MACRO {jacm} {"Journal of the ACM"}
MACRO {jcss} {"Journal of Computer and System Sciences"}
MACRO {scp} {"Science of Computer Programming"}
MACRO {sicomp} {"SIAM Journal on Computing"}
MACRO {tocs} {"ACM Transactions on Computer Systems"}
MACRO {tods} {"ACM Transactions on Database Systems"}
MACRO {tog} {"ACM Transactions on Graphics"}
MACRO {toms} {"ACM Transactions on Mathematical Software"}
MACRO {toois} {"ACM Transactions on Office Information Systems"}
MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} {"Theoretical Computer Science"}

MACRO {jan} {"January"}
MACRO {feb} {"February"}
MACRO {mar} {"March"}
MACRO {apr} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"August"}
MACRO {sep} {"September"}
MACRO {oct} {"October"}
MACRO {nov} {"November"}
MACRO {dec} {"December"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  "" 't :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " " * bbl.etal * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " " * bbl.etal * }
            { bbl.and space.word * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key	
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key	
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
%
% Provide label formatting by key if author is null,
% or by organization if key is also null.
%
{ author empty$
    { key empty$
        { organization empty$
            { "no author, key or organization in " cite$ * warning$
              cite$ #1 #3 substring$ }
            { organization }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
%
% Provide label formatting by key if editor is null,
% or by organization if key is also null.
%
{ editor empty$
    { key empty$
        { organization empty$
            { "no editor, key or organization in " cite$ * warning$
              cite$ #1 #3 substring$ }
            { organization }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
%
% Includes "article" and "misc" which have had an editor option added,
% and alias entry types "magazine", "newspaper" and "webpage".
%
{ type$ "article" =
    type$ "book" =
      type$ "inbook" =
        type$ "magazine" =
          type$ "misc" =
            type$ "newspaper" =
              type$ "webpage" =
            or
          or
        or
      or
    or
  or
    'author.editor.key.label
    { type$ "proceedings" =
    'editor.key.organization.label
       { type$ "manual" =
          'author.key.organization.label
          'author.key.label
        if$
       }
     if$
    }  
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
     { pop$ "{n.d.}" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr #1 >
        { nameptr #3
          #1 + =
          numnames #6
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
%
% Includes "article" and "misc" which have had an editor option added,
% and alias entry types "magazine", "newspaper" and "webpage".
%
{ calc.label
  label sortify
  "    "
  *
  type$ "article" =
    type$ "book" =
      type$ "inbook" =
        type$ "magazine" =
          type$ "misc" =
            type$ "newspaper" =
              type$ "webpage" =
            or
          or
        or
      or
    or
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  #1 entry.max$ substring$
  'sort.label :=	
  sort.label	
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT	

STRINGS { last.label next.extra }

INTEGERS { last.extra.num number.label }

FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT		% by sort.label, year, title = final bibliography order

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"	
  write$ newline$
  "\providecommand{\url}[1]{\normalfont{#1}}"
  write$ newline$
  "\providecommand{\doi}[1]{\normalfont{#1}}"
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
