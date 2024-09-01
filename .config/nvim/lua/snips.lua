local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
	s("iomain", fmt(
		[[
		#include <iostream>

		int main(){{
			{}
			return 0;
		}}
		]], { i(0)
		})
	)
})

ls.add_snippets("text", {
	s("prblm", fmt(
		[[
		PROBLEM
		{}

		INPUT
		first line - {}

		OUTPUT
		first line - {}

		EXAMPLE
		input:
		{}
		output:
		{}
		]], { i(0), i(1), i(2), i(3), i(4)
		})
	)
})

ls.add_snippets("lua", {
	s("snip_body", fmt(
		[[
			ls.add_snippets({}, {{
				{}
			}})
		]], { i(1), i(2) }
	)),
	s("snip", fmt(
		[===[
		s("{}", fmt(
			[[
				{}
			]], {{{}}}
		)),
		]===], { i(1), i(2), i(3) }
	))
})

ls.add_snippets("nix", {
	s("new", fmt(
		[[
		{{ config, pkgs, inputs, ... }}:
		{{
			{}
		}}
		]], { i(0) }
	)),
	s("nvim-plugin", fmt(
		[[
		{{
			plugin = {};
			type = "lua";
			config = ''
				{}
			'';
		}}
		]], { i(1), i(2) }
	))
})

ls.add_snippets("rust", {
	s("adventure_of_code", fmt(
		[[
			use std::fs;

			fn part1(s: &str){{
			}}

			fn part2(s: &str){{
			}}

			fn main(){{
					let file = fs::read_to_string("./input{}.txt").unwrap();
					part1(&file);
					part2(&file);
			}}

		]], { i(1) }
	)),
	s("codeforces", fmt(
		[[
			use std::io;

			fn main() {{
				let mut buf = String::new();
				io::stdin().read_line(&mut buf).unwrap();

				let tests: usize = buf.trim().parse().unwrap();
				for _ in 0..tests {{
					buf.clear();
					io::stdin().read_line(&mut buf).unwrap();
					{}
				}}
			}}
		]], { i(1) }
	)),
	s("in_one", fmt(
		[[
			buf.clear();
			io::stdin().read_line(&mut buf).unwrap();
			let {}: {} = buf.trim().parse().unwrap();
		]], { i(1), i(2) }
	)),
	s("in_vec", fmt(
		[[
			buf.clear();
			io::stdin().read_line(&mut buf).unwrap();
			let {}: Vec<{}> = buf
        .trim()
        .{}()
        .map(|x| {})
        .collect();

		]], { i(1), i(2), i(3), i(4) }
	)),
	s("in_mul", fmt(
		[[
			buf.clear();
			io::stdin().read_line(&mut buf).unwrap();
			let ({}) = {{
				let mut buf = buf.split_whitespace().map(|x| x.trim());
				(
					buf.next().unwrap().parse::<{}>().unwrap(),
				)
			}};
		]], { i(1), i(2) }
	)),
})

local function copy(args)
	return args[1]
end
ls.add_snippets("toml", {
	s("prob", {
		t("[[bin]]"),
		t({'', 'name = "'}),
		i(1),
		t({'"', 'path = "src/'}),
		f(copy, 1),
		t('.rs"'),
	}),
})

ls.add_snippets("desktop", {
	s("new", fmt(
		[[
[Desktop Entry]
Name={}
Exec={}
Terminal=false
Categories={}
Type=Application
StartupNotify=false
X-GNOME-Autostart-enabled=true
		]], { i(1), i(2), i(3) }
	)),
})
