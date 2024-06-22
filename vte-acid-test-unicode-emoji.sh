#! /usr/bin/env zsh
# This file is part of the "libterminal" project
#   Copyright (c) 2019-2020 Christian Parpart <christian@parpart.family>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# {{{ helper
function sgr() {
    local params="$(echo ${@} | sed 's/ /;/g')"
    echo -ne "\e[${params}m"
}

function sgr_line() {
    sgr "${@}"
    printf "\033[2K" # EL, Erase in line
}

uc_title() {
    sgr_line 41 1
    printf -ne "     $(sgr 21)${1}$(sgr 0)\n"
}

uc_heading() {
    sgr_line 41 1 4
    uc_row "AB" "p.style" "comment$(sgr 0)"
}

uc_section() {
    sgr_line 44 1 4
    printf "│  │ (${1})"
    sgr 0
    printf "\n"
}

sgr_col() {
    printf "\033[5G"
}

uc_row() {
    local codepoints="$(printf "${1}")"
    local presentation_style="${2}"
    local comment="${3}"
    printf "│${1}│ %7s │ %s\n" "${presentation_style}" "${comment}"
}
# }}}

main() {
    clear
    # uc_title "VTE Unicode Acid Test"
    uc_heading "AB" "P.style" "Comment"

    uc_section "text default"
    uc_row "\u00A9 " "Text" "copyright symbol" # add a space because it's meant to be Narrow-width
    uc_row "\u26A0 " "Text" "construction symbol" # add a space because it's meant to be Narrow-width

    uc_section "emoji default - simple codepoints"
    uc_row "\U0001F600" "Emoji" "standard smiling face"
    uc_row "\U0001F926" "Emoji" "facepalm"

    uc_section "ZWH - zero width joining characters"
    uc_row "\U0001F441\UFE0F\U200D\U0001F5E8\UFE0F" "Emoji" "Eye with speech bubble"
    uc_row "\U0001F926\U0001F3FC\u200D\u2642\uFE0F" "Emoji" "facepalm with fitzpatrick type-3, male sign"
    uc_row "\U0001F468\u200D\U0001F469\u200D\U0001F467\u200D\U0001F466" "Emoji" "family"

    uc_section "VS16: text default override to emoji"
    uc_row "\u00A9\uFE0F" "Emoji" "copyright emoji"
    uc_row "\u26A0\uFE0F" "Text" "construction emoji" # add a space because it's meant to be Narrow-width
    uc_row "\U0001F441\UFE0F" "Emoji" "eye"
    uc_row "\U0001F5E8\UFE0F" "Emoji" "speech bubble"
    uc_row "\U0001F926\U0001F3FC" "Emoji" "facepalm with fitzpatrick type-3 modifier"

    uc_section "VS15: emoji default override to text"
    uc_row "\U0001F600\uFE0E" "Text" "standard smiling face"
    uc_row "\U0001F602\uFE0E" "Text" "another face"

	uc_section "Flag Sequences"
	uc_row "\U0001F1FA\U1F1F8" "Emoji" "USA flag"
    uc_row $'\U0001F3F4\U000E0067\U000E0062\U000E0065\U000E006E\U000E0067\U000E007F' "Emoji" "England"
}

main
COL="\033[41m"
RST="\033[m"
#echo -ne "${COL}|\U0001F926\U0001F3FC\u200D\u2642\uFE0F${RST}\n"
