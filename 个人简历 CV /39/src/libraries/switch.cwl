%%
%% Author: Ali Asghar Momeni Vesalian (momeni.vesalian@gmail.com)
%% 12/30/2017 AD
%% Related Package: switch.sty
%%

\xifthen[options: comparison type = {number, string}]{test}{true}
\xifthenelse[options: comparison type = {number, string}]{test}{true}{false}

\xifequal[options: comparison type = {number, string}]{first}{second}{true}
\xifequalelse[options: comparison type = {number, string}]{first}{second}{true}{false}

\begin{xswitch}[options: comparison type = {number, string}]{variable}
    \xcase{value}{command}
    \xother{command}
\end{xswitch}
