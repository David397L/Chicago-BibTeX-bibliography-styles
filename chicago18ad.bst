%%% ====================================================================
%%%  @BibTeX-style-file{
%%%     author          = "David Lamkin",
%%%     version         = "B.01",
%%%     date            = "28 June 2025",
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BibTeX `chicago18ad' bibliography style (28-Jun-25 version)
% An adaptation of the `apalike' style, for use with the natbib package.
% Copyright (C) 2025, All rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `chicago18ad.bst'. 
% This restriction helps ensure that all copies are identical.
%
% This style should be used with the `natbib' LaTeX style (natbib.sty).
% The form of the \bibitem entries is
%   \bibitem[Jones et al(1990)]{key}...
% The essential feature is that the label (the part in brackets) consists
% of the author names, as they should appear in the citation, with the year
% in parentheses following. There must be no space before the opening
% parenthesis!
% \cite's come out like "(Jones 1990)" in the text but there are no labels
% in the bibliography, and something like "1990" comes out immediately
% after the author. A `year' field is required for every entry, and so is 
% either an author (or an editor) field or a key field.
%
% History:
%   15-sep-86   (SK,OP) Original version, by Susan King and Oren Patashnik.
%   10-nov-86   (OP) Truncated the sort.key$ string to the correct length
%               in bib.sort.order to eliminate error message.
%   24-jan-88   (OP) Updated for BibTeX version 0.99a, from alpha.bst 0.99a;
%               apalike now sorts by author, then year, then title;
%               THIS `apalike' VERSION DOES NOT WORK WITH BIBTEX 0.98i.
%   28-jun-25   Updated for Chicago author-date (18th edition), for BibTeX 0.99d.

ENTRY
  { address
    archive
    author
    booktitle
    chapter
    collaboration
    doi
    edition
    editor
    eid
    eprint
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
  { label extra.label sort.label }

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
    { pop$
      ""
    }
    { "(" swap$ * ")" *
    }
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
% If there are more than six, list the first three, followed by "et al.".
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
  } if$
}

FUNCTION {format.names.firstfirst}
%
% Format names with first name followed by surname every time.
% Like format.names, ALL names are formatted.
% Should there be an upper limit to the number of names included here?
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
  } if$
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

FUNCTION {format.eprint}
%
% Work in progress: improve in a future release so
% as to process prefix and class fields properly
%
{ eprint duplicate$ empty$
    'skip$
    { "\eprint"
      archive empty$
        'skip$
        { "[" * archive * "]" * }
      if$
      "{" * swap$ * "}" *
    }
  if$
}

FUNCTION {urldate.check}
{ lastchecked empty$
    { urldate empty$
        { "" }
        { " [Accessed " urldate * "]" * add.period$ add.blank }
      if$
    }
    { " [Accessed " lastchecked * "]" * add.period$ add.blank }
  if$
}

FUNCTION {format.doi.or.url}
%
% Includes the DOI if available, or else the URL
%
{ doi empty$
    { url empty$
        { "" }
        { urldate.check * "\url{" url * "}" * }
      if$
    }
    { "\doi{" doi * "}" * }
  if$
}

FUNCTION {format.title.plain}
%
% Format a title without quotation marks, if required.
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
% Completes quotation marks around title, including punctuation mark
% (in place of a new.block).
%
{ title empty$
    'skip$
    { before.all 'output.state := }
  if$
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
              space * volume colon * format.pages *
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
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
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
% For use in {inproceedings} and {proceedings}
%
{ address "address" bibinfo.check
}

FUNCTION {format.month}
{ month empty$
    { "" }
    { month "month" bibinfo.check
    "" swap$ * "" *}
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
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
  format.authors output
  author format.key output
  format.date "year" output.check
  new.block
  format.btitle "title" output.check
  new.sentence
  organization output
%  address output
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
  add.blank
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  format.month output
  new.block
  url empty$
    { format.title.plain output }
    { format.title "title" output.check
      end.quote.title }
  if$ 
  new.sentence
  howpublished output
  new.sentence
  format.eprint output
  new.sentence
  note output
  new.sentence
  format.doi.or.url output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  new.block
  format.title "title" output.check
  add.blank
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
  format.eprint output
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

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key	
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  "("
  *
  year duplicate$ empty$
    { pop$ "{n.d.}" }
    'skip$
  if$
  *                 % the matching closing ")" comes in at reverse.pass
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$	
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't := 
      nameptr numnames = t "others" = and
        { bbl.etal * }
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

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { "to sort, need editor or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
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

INTEGERS { last.extra.num }

FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
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
  label extra.label * ")" * 'label :=
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
  "\begin{thebibliography}{}" 
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"	
  write$ newline$
  "\providecommand{\url}[1]{\normalfont{#1}}"
  write$ newline$
  "\providecommand{\doi}[1]{\normalfont{#1}}"
  write$ newline$
  "\providecommand{\eprint}[2][]{\url{#2}}"
  write$ newline$
  "\expandafter\ifx\csname eprint\endcsname\relax\def\eprint#1{\url{#1}}\fi"
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
