#!/usr/bin/env bash
# was making this to reformat all the notes to stop using the bryan jenks symbol style notation 

fileSymbolPat="[•†%=;∑+@{&~%]"

# checking for tag patterns in obsidian frontmatter
tagsEmpty="^tags: \[\]"
tagsNoBrac="^tags:\s*$"


# the long sed: needs to be done because of some problem with the -i flag in macos sed.
# this does the edits in a .tmp file and then renames it back to the original / inteded name
generateTags() {
for file in *; do

    if [[ $file == *.md ]] && [[ ${file::1} == $fileSymbolPat ]]; then

        # there are no [[ ]] as then grep would not be run as a function call.
        # the -q flag evaluates to 0 (match found) or 1 (no match is found)
        # 0 therefore enters the if statement
        if grep -q "$tagsEmpty" "$file"; then
            sed -e "s/^[tT]ags: \[/tags: \[${file::1}/g" "${file}" > "${file}.tmp" && mv "${file}.tmp" "${file}"

        elif grep -q "$tagsNoBrac" "$file"; then
            sed -e "s/^[tT]ags:/tags: \[${file::1}\]/g" "${file}" > "${file}.tmp" && mv "${file}.tmp" "${file}"

        else
            sed -e "s/^[tT]ags: \[/tags: \[${file::1}, /g" "${file}" > "${file}.tmp" && mv "${file}.tmp" "${file}"
        fi
    fi

done
}


renameDocText() {
    # rename the wiki links
for file in *; do
    if [[ -f "$file" ]] && [[ ${file::1} == $fileSymbolPat ]]; then
    sed -e "s/\[\[[•†-%=;∑-+@{&~%]\ /\[\[/g; s/^#\ ${fileSymbolPat}/#/g" "${file}" > "${file}.tmp" && mv "${file}.tmp" "${file}"
    fi
done
}

renameFiles() {
  for file in *; do
    if [[ -f "$file" ]] && [[ ${file::1} == $fileSymbolPat ]]; then  # check if file is a regular file
      mv "$file" "${file:1}"
    fi
  done
}


generateTags
renameDocText
renameFiles

