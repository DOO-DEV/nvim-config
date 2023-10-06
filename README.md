Here i share my neovim conifg

my folder structure is:

```
.
├── after
│   └── plugin
│       └── test.lua
├── init.lua
└── lua
    └── test
        └── file.lua
```

as you know `after/..` is autoload(no need for requiring in init.lua)
my personal configs are under `lua/..`

I use these tools right now:
[x] Packer(plugin manager)
[x] Catppuccin(theme)
[x] Treesitter
[x] Nvim-lspconfig(an api for intract with treesitter)
[x] Bunch of auto-complete stuff(see `lua/plugin.lua`)

There is a say: Don't try make vim like other editors. vim has unique philosophy, accept vim as it is :)