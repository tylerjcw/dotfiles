#!/bin/zsh

(
	month=$(date +%B)
	year=$(date +%Y)

	gcal --cc-holiday=US_NY | sed -e 's/</^bg(#3BA275)^fg(#303030) /;s/>/ ^fg()^bg()/'\
								  -e 's/:/^bg(#6095C5)^fg(#303030) /;s/:/ ^fg()^bg()/'\
								  -e 's/Su Mo Tu We Th Fr Sa/^fg(#75DAA9)Su Mo Tu We Th Fr Sa^fg()/' \
								  -e "s/$(date +'%B %Y')/^fg(#98CBFE)$(date +'%B %Y')^fg()/" \
) | dzen2 -xs 1 -fg '#FFFFFF' -bg '#303030' -p -l 8 -x 851 -y 740 -w 172 -h 16 -fn 'bitocra' -e 'onstart=uncollapse,hide;button1=exit;button3=exit;'