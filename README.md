# Bootstrap script for the Windows Subsystem for Linux (WSL)

PLEASE BE AWARE : This information is quite out of date, and WSL has moved on since it was written. Now, my other repo [`Linux Comfy Chair`][lcc] should work for the WSL Ubuntu images and other Debian-based Distros.

This is a very simple (for now) script to set up a NEW UNMODIFIED [`Windows Subsystem for Linux`][wsl] (WSL hereafter) with the following functionality :

* Updated to the latest package versions from Ubuntu upstream.
* Have the `build-essential` package installed plus all required support libraries to enable the below functionality to work.
* [`Sublime Text 3`][sublime] Editor installed as standard with `Package Control` and a number of useful packages.
* The Latest version of [`Git`][git] installed. A skeleton `.gitconfig` will be set up with a few aliases.
* The [`Ruby`][ruby] scripting language installed via [`Rbenv`][rbenv] with the current version of Rails installed as standard along with several other common gems.
* [`Node.js`][node] both the most recent LTS version and latest stable version via [`NVM`][nvm]. The LTS version is activated by default.
* The [`Python`][python] scripting language both the latest 2.7 and 3.x versions via [`Pyenv`][pyenv]
* Install the latest STABLE [`Perl`][perl] scripting language via [`Perlbrew`][perlbrew] with cpan and cpanm pre-installed and configured. Several PERL modules that make cpan easier are also pre-installed
* Enable resolution of WINS hostnames
* Install `GEdit` (Text editor) and `pcmanfm` (file manager). Both can be run from the Bash shell using `gedit` and `pcmanfm` respectively

Note also since WSL is basically just a standard Ubuntu installation this sctipt should also work unmodified on an Ubuntu Distribution, though currently untested.

**Please read all of this file before starting**

## Important
The default setup of WSL is to merge the Windows PATH values into the Linux path. However this can lead to problems and contamination. for example if you have comparable tools installed under native Windows (Perl, Python, Ruby, Node, NVM etc) then they could conflict with or bypass the WSL Linux equivalents __even causing the bootstrap script to fail__.  
Personally I want the WSL to be a completely isolated system that will not have any Windows artifacts - for a start it makes the PATH variable a great deal shorter and easier to troubleshoot!! To this result there is a Windows registry file `no-windows-path.reg` in the repository that sets a simple registry flag to stop this behavior. After that flag is set the only PATH strings __under WSL__ will be those required by Linux. Note that this will __not__ affect your Windows PATH in any way.  
__You must run this registry file from a standard `Windows command prompt (NOT WSL)` or using Explorer
, and the WSL (Bash) environment must be CLOSED before you do this.__  

The contents of the file `no-windows-path.reg` are :

```
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss]
AppendNtPath=dword:00000000
```
If you uninstall and reinstall WSL for any reason you will need to reapply the above Registry file.

## Usage
The simplest way to use this script is to clone into a completely new WSL environment. If you already have a configured WSL system there are instructions below on how to reset this to 'factory' defaults __[TODO]__.  
From within WSL run the following:
```
git clone https://github.com/seapagan/ubuntu-win-bootstrap.git
cd ubuntu-win-bootstrap
./bootstrap.sh
```
## X-Server
To use the included version of `Sublime Text` we need to have an X-Server installed on the native Windows (not WSL) system. I'd recommend installing [`VcXsrv`][vcxsrv]. This is a straightforward install and then run the `XLaunch` utility leaving everything at the default settings. We already set the `DISPLAY` variable in WSL to point to this as part of the bootstrap.  
Once that is installed and running you will be able to use any other X-Window based programs you wish to install - it is even possible to have the full UBUNTU graphical desktop running if that is your desire.

## Sublime Text 3
The bootstrap script will automatically install Sublime Text 3 with `Package Control` and a number of useful packages. These will properly be installed during the first and second times Sublime Text is opened. I recommend you run Sublime the first time,  wait a few seconds them close (this installs the `Package control` plugin). Open it a second time and the rest of the packages will be installed. It may take a few minutes for the packages to install depending on your internet speed so try not to close the program too soon.

#### Running sublime Text
```bash
$ subl
```

#### Packages installed are :
* All Autocomplete
* Babel
* Color Highlighter
* DocBlockr
* Emmet
* ExportHtml
* Git
* GitGutter
* HexViewer
* Markdown Preview
* MarkdownEditing
* Package Control
* SassBeautify
* SideBarEnhancements
* SublimeCodeIntel
* SublimeLinter
* SublimeREPL
* Terminal
* TrailingSpaces

The list of packages that are installed can be changed or added to by editing the  [Package Control.sublime-settings](support/Package%20Control.sublime-settings)

If you have a License for Sublime Text, copy that from your email into a file `support/License.sublime_license` before running the Bootstrap script, and it wil be properly installed to Sublime for you.

## Other Utilities
There are several other useful utilities installed, and the list is growing.
#### GEdit (Text Editor)
A nice basic text editor when you don't need all the functionality of Sublime Text.
```
$ gedit
```
#### PCManFM (File Manager)
A useful file manager to export and maintain the WSL file system. Especially since you should NEVER create, edit or delete files within the WSL structure using any Windows tool.
```
$ pcmanfm
```

## To-Do

* More robust fall-over on already configured systems. If Rbenv etc are already installed then ignore installing that part
* Split each different section out to it's own file for clarity
* Perl Modules `IPC::Msg` and `IO::Socket::IP` fail on update, needs further investigation

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[wsl]: https://msdn.microsoft.com/commandline/wsl/about
[sublime]: https://www.sublimetext.com/
[git]: https://git-scm.com
[ruby]: https://www.ruby-lang.org
[rbenv]: https://github.com/rbenv/rbenv
[node]: https://nodejs.org
[nvm]: https://github.com/creationix/nvm
[python]: https://www.python.org/
[pyenv]: https://github.com/pyenv/pyenv
[perl]: https://www.perl.org/
[perlbrew]: https://perlbrew.pl/
[vcxsrv]: https://sourceforge.net/projects/vcxsrv/
[lcc]: https://github.com/seapagan/linux-comfy-chair
