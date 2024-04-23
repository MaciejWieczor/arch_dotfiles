#!/usr/bin/python

import argparse, os, re

def replacement_func(match_obj):
	return match_obj.group(1) + '/' + match_obj.group(2) + 'html'

def main():
	parser = argparse.ArgumentParser()
	required = parser.add_argument_group('required arguments')
	required.add_argument('dir', help="Root directory")
	required.add_argument('file', help="Currently edited file")
	args = parser.parse_args()

	html_file = args.file
	lines = []
	with open(html_file, "r") as fp:
		lines = fp.readlines()
		lines = [re.sub(r"(href=\")(.*)(md)", replacement_func, line) for line in lines]
		tmp_lines = []
		found = False
		for line in lines:
			if line == "<!-- vim-markdown-toc GFM -->":
				found = not found
			if found or line == "Spis treści:":
				pass
			else:
				tmp_lines.append(line)
		lines = tmp_lines
	with open(html_file, "w") as fp:
		fp.write(''.join(lines))

main()
