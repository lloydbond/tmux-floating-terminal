#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

default_floating_scratch_term="M-i"
default_floating_scratch_to_active_win="M-h"
default_floating_scratch_to_win="M-l"
default_floating_active_pane_to_scratch="M-m"

set_floating_scratch_term_binding() {
	local key_bindings="$(get_tmux_option "@floating_scratch_term" "$default_floating_scratch_term")"
	local key
	for key in $key_bindings; do
			tmux bind-key "$key" "if-shell -F '#{==:#{session_name},floating}' { 
			 detach-client 
			 } {
			set -gF '@last_session_name' '#S'
			popup -d '#{pane_current_path}' -xC -yC -w70% -h70% -E 'tmux new -A -s floating'
		}"
	done
}

set_floating_scratch_to_win() {
	local key_bindings="$(get_tmux_option "@floating_scratch_to_win" "$default_floating_scratch_to_win")"
	local key
	for key in $key_bindings; do
		tmux bind "$key" "if-shell -F '#{!=:#{session_name},floating}' {
		 break-pane 
		} {
		 run-shell 'bash -c \"tmux break-pane -s floating -t \"$(tmux show -gvq '@last_session_name'):\"\"'
	 }"
	done
}

set_floating_scratch_to_active_win() {
	local key_bindings="$(get_tmux_option "@floating_scratch_to_active_win" "$default_floating_scratch_to_active_win")"
	local key
	for key in $key_bindings; do
		tmux bind "$key" "if-shell -F '#{!=:#{session_name},floating}' {
		 break-pane -d 
		 } { 
		 run-shell 'bash -c \"tmux break-pane -d -s floating -t \"$(tmux show -gvq '@last_session_name'):\"\"'
	  }"
	done
}

set_floating_active_pane_to_scratch() {
	local key_bindings="$(get_tmux_option "@floating_active_pane_to_scratch" "$default_floating_active_pane_to_scratch")"
	local key
	for key in $key_bindings; do
		tmux bind "$key" "if-shell -F '#{!=:#{session_name},floating}' {
		 select-pane -m 
		 popup -d '#{pane_current_path}' -xC -yC -w70% -h70% -E 'tmux new -A -s floating tmux join-pane'
		 }"
	done
}

main() {
	set_floating_scratch_term_binding
	set_floating_scratch_to_active_win
	set_floating_scratch_to_win
	set_floating_active_pane_to_scratch
}
main
