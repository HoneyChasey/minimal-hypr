~/.config/quickshell/
├── shell.qml          ← entry point
├── .qmlls.ini         ← config for my LSP (please generate one)
│
├── bar/               ← All about bar 
│   ├── Bar.qml        ← The panelwindow principal
│   ├── Clock.qml      ← clock
│   ├── Workspaces.qml ← The workspaces
│   └── SysTray.qml    ← The zone system
│
├── services/          ← logic/data (backend)
│   ├── Audio.qml      ← Volume manager
│   └── Network.qml    ← Network manager
│
└── config/            ← global config
    └── Theme.qml      ← theme, color etc etc (the css)



Warning, in QLM, we will use Maj in the first name of the file.
