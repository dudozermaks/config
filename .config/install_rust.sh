#!/usr/bin/env bash

paru -R rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# add rust-analyzer
rustup component add rust-analyzer
